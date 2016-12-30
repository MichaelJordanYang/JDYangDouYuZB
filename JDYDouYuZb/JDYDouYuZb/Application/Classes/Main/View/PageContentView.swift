//
//  PageContentView.swift
//  JDYDouYuZb
//
//  Created by xiaoyang on 2016/12/30.
//  Copyright © 2016年 JDYang. All rights reserved.
//  封装中间显示内容的view   pageContentViewController

import UIKit

//注册标识
fileprivate let contentCellID = "contentCellID"

class PageContentView: UIView {

    // MARK:- 定义属性把传进来的控制器保存起来
    fileprivate var childVcs : [UIViewController] //子控制器需要保存
    fileprivate var parentViewController : UIViewController //子控制器也要保存
    
    
    // MARK:- 懒加载UICollectionView创建collectionView一定要有layout
    fileprivate lazy var collection : UICollectionView = {
       //1.创建layout
        let layout = UICollectionViewFlowLayout()//创建流水布局
        layout.itemSize = self.bounds.size //设置layou的大小
        layout.minimumLineSpacing = 0 //设置行间距
        layout.minimumInteritemSpacing = 0 //设置item的间距
        layout.scrollDirection = .horizontal //设置滚动方向水平滚动
        
        //2.创建UICollectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false //设置水平方向的指示器不显示
        collectionView.isPagingEnabled = true //UICollectionView需要分页设置分页
        collectionView.bounces = false //设置不超出内容的滚动区域
        collectionView.dataSource = self //想要collectionView有数据必须设置数据源遵循dialing
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellID) //注册cell标识
        //collectionView.delegate = self
        return collectionView
    }()
    
    // MARK:- 自定义构造函数
    // MARK:- 定义数组传入控制器与父控制器
    init(frame: CGRect, childVcs : [UIViewController], parentViewController : UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: -设置UI界面
extension PageContentView{
    
    fileprivate func setUpUI() {
        //1.将所有子控制添加到父控制器中
        for childVc in childVcs {
            parentViewController.addChildViewController(childVc)
        }
        
        //2.添加UICollectionView,用于在cell中存放控制器的view
        addSubview(collection)
        collection.frame = bounds
    }
}

// MARK: -遵守UICollectionViewDataSource
extension PageContentView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.创建cell 从缓存池中拿出cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellID, for: indexPath)
        
        //2.给cell设置内容
          //cell有循环利用最好把之前的内容移除
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}
