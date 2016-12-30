//
//  PageTitleView.swift
//  JDYDouYuZb
//
//  Created by xiaoyang on 2016/12/29.
//  Copyright © 2016年 JDYang. All rights reserved.
//

import UIKit

//确定滚动条的高度
fileprivate let kscrollLineH : CGFloat = 2

class PageTitleView: UIView {

    // MARK:- 定义数组属性
    fileprivate var titles : [String]
    
    // MARK:- 懒加载属性标题数组UILabel
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
   
    // MARK:- 懒加载属性创建scrollView
    fileprivate lazy var scrollView : UIScrollView = {
    
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false //水平指示线条不显示
        scrollView.scrollsToTop = false //状态栏点击回到最顶部需要设置false属性
        //scrollView.isPagingEnabled = false //设置分页
        scrollView.bounces = false//设置滚动不超过内容的范围
        return scrollView
    }()
    
    // MARK:- 懒加载属性创建scrollLine滚动的线
    fileprivate lazy var scrollLine : UIView = {
       
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.purple
        return scrollLine
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles //把所有传进来的标题用这个titles属性保存起来
        
        super.init(frame: frame)
        
        // 设置UI界面
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: -设置UI界面
extension PageTitleView {
    fileprivate func setUpUI() {
        //1.添加UIScrollview
        addSubview(scrollView)
        scrollView.frame = bounds //设置scrollView的fame等于当前view的bounds
        
        //2.添加title对应的Label
        setUpTitleLabels()
        
        //3.设置底部的线条和滚动的滑块
        setUpBottomMenuAndScrollLine()
    }
    
    // MARK:- 添加title对应的Label
    fileprivate func setUpTitleLabels() {
        
        //0.确定UILabel的值因为Label不需要再for里面每次都遍历
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kscrollLineH
        //let labelX : CGFloat = labelW * CGFloat(index)  //X是多少是根据宽度决定,所以先设置宽度
        let labelY : CGFloat = 0

    
        //根据有多少个标题就创建多少个label
        for (index, title) in titles.enumerated(){ //通过这种方式创建既可以拿到下标也可以拿到titles
            //1.创建UILabel 因为每个标题都对应着lable,在每次遍历的时候都创建label
            let label = UILabel()
            
            //2.设置label的属性
            label.text = title //名字就对应着title
            label.tag = index  //给label设置tag, 想拿到label对应的下标的话就拿到tag
            label.font = UIFont.systemFont(ofSize: 16.0)//设置字体大小
            label.textColor = UIColor.darkGray //设置文字颜色
            label.textAlignment = .center //设置为居中
            
            //3.设置label的frame
            //let labelW : CGFloat = frame.width / CGFloat(titles.count)
            //let labelH : CGFloat = frame.height - kscrollLineH
            let labelX : CGFloat = labelW * CGFloat(index)  //X是多少是根据宽度决定,所以先设置宽度
            //let labelY : CGFloat = 0
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4.将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label) //拿到titleLabels数组将创建的label加入到数组中
        }
    }
    
    // MARK:- 设置底部的线条和滚动的滑块
    fileprivate func setUpBottomMenuAndScrollLine() {
        //1.添加底部的线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.orange
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: lineH)
        //scrollView.addSubview(bottomLine)
        addSubview(bottomLine)
    
        //2.添加scrollLine滚动的线
         //2.1获取第一个label
        guard let firstLabel = titleLabels.first else { return } //titleLabels.first是可选类型必须用guard做一个校验
        firstLabel.textColor = UIColor.purple
        
        //2.2设置scorollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kscrollLineH, width: firstLabel.frame.width, height: kscrollLineH)
    }
    
}
