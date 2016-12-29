//
//  HomeViewController.swift
//  JDYDouYuZb
//
//  Created by xiaoyang on 2016/12/24.
//  Copyright © 2016年 JDYang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setUpUI()
    }

}



// MARK: -设置UI页面
    extension HomeViewController {
        
        fileprivate func setUpUI() {
            //1.设置导航栏
            setUpNavigationBar()
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
