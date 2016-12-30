//
//  HomeViewController.swift
//  JDYDouYuZb
//
//  Created by xiaoyang on 2016/12/24.
//  Copyright © 2016年 JDYang. All rights reserved.
//

import UIKit

fileprivate let kTitleViewHeight : CGFloat = 40

class HomeViewController: UIViewController {

    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {
        //设置菜单标题尺寸
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenWidth, height: kTitleViewHeight)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]//设置菜单标题显示内容文字
        let titleView = PageTitleView(frame: titleFrame, titles: titles)//保存到pageTitleView中
        //titleView.backgroundColor = UIColor.purple
        return titleView
    }()
    
    fileprivate lazy var pageContentView : PageContentView = {
        //1.确定内容的frame
        let contentHeight = kScreenHeight - kStatusBarH - kNavigationBarH - kTitleViewHeight
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewHeight, width: kScreenHeight, height: contentHeight)
       
        //2.确定所有的子控制器
        var childs = [UIViewController]() //创建数组子控制器
        //通过for循环创建
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childs, parentViewController: self)
        return contentView
    }()
    
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setUpUI()
    }

}

// MARK: -设置UI页面
    extension HomeViewController {
        
        fileprivate func setUpUI() {
            //0.不需要调整UIScrollview的内边距.  系统默认会帮我们调整所以设置不调整内边距
            automaticallyAdjustsScrollViewInsets = false
            
            //1.设置导航栏
            setUpNavigationBar()
            
            //2.添加TitleView
            view.addSubview(pageTitleView)
            
            //3添加ContenView
            view.addSubview(pageContentView)
            pageContentView.backgroundColor = UIColor.orange
        }
            //设置导航栏
        fileprivate func setUpNavigationBar() {
            
            //1.设置左侧的按钮
            /*
            let btn = UIButton()
            let image = UIImage(named: "logo")
            btn.setImage(image, for: .normal)
            btn.sizeToFit()//让按钮自适应图片
            */
            navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
            //UIBarButtonItem(customView: btn)//传一个自定义view
            
            //2.设置右侧的item
            let size = CGSize(width: 40, height: 40)//定义宽高尺寸
            /*
            let hisoryBtn = UIButton()
            hisoryBtn.setImage(UIImage(named: "image_my_history"), for: .normal)
            hisoryBtn.setImage(UIImage(named: "Image_my_history_click"), for: .highlighted)
            //hisoryBtn.sizeToFit()
            hisoryBtn.frame = CGRect(origin: CGPoint.zero, size: size)
             */
            let historyItem = UIBarButtonItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
            //UIBarButtonItem.createItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
            
            /*
            let searchBtn = UIButton()
            searchBtn.setImage(UIImage(named: "btn_search"), for: .normal)
            searchBtn.setImage(UIImage(named: "btn_search_clicked"), for: .highlighted)
            //searchBtn.sizeToFit()
            searchBtn.frame = CGRect(origin: CGPoint.zero, size: size)
            */
            let searchItem = UIBarButtonItem(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
            //UIBarButtonItem.createItem.createItem(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
            
            /*
            let qrcodeBtn = UIButton()
            qrcodeBtn.setImage(UIImage(named: "Image_scan"), for: .normal)
            qrcodeBtn.setImage(UIImage(named: "Image_scan_click"), for: .highlighted)
            //qrcodeBtn.sizeToFit()
            qrcodeBtn.frame = CGRect(origin: CGPoint.zero, size: size)
            */
            let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", hightImageName: "Image_scan_click", size: size)
            //UIBarButtonItem.createItem(imageName: "Image_scan", hightImageName: "Image_scan_click", size: size)
            
             navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        }
        
}
