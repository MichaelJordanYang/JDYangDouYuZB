//
//  UIBarButtonItem-Extension.swift
//  JDYDouYuZb
//
//  Created by xiaoyang on 2016/12/29.
//  Copyright © 2016年 JDYang. All rights reserved.
//

//导入UIKit框架
import UIKit
//给系统类做扩展
extension UIBarButtonItem{
    /*
     扩充类方法
    class func createItem(imageName : String, hightImageName : String, size : CGSize) ->UIBarButtonItem{ //返回一个UIBarButtonItem
        //创建按钮
        let btn = UIButton()
        //设置按钮属性
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        
        //给按钮设置尺寸
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        //将自定义按钮返回出去
        return UIBarButtonItem(customView: btn)
        
    }
    */
    
    
    //扩充构造函数
    //遍历构造函数: 1> 以convenience开头 2>在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName : String, hightImageName : String = "", size : CGSize = CGSize.zero) {
        //创建按钮
        let btn = UIButton()
        //设置按钮图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if hightImageName != "" {
            
            btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        }
        
        //给按钮设置尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
     
        //创建UIBarButtonItem
        self.init(customView : btn)
    }
}
