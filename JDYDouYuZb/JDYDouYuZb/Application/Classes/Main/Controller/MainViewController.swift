//
//  MainViewController.swift
//  JDYDouYuZb
//
//  Created by xiaoyang on 2016/12/24.
//  Copyright © 2016年 JDYang. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        //1.创建控制器
//        let vc = UIViewController()
//        //2.设置背景色
//        vc.view.backgroundColor = UIColor.orange
//        //3.添加到控制器
//        addChildViewController(vc)
        
        /*
        //1.通过storyboard获取控制器
        let childVc = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()!
        
        //2.将childVc作为子控制器
        addChildViewController(childVc)
        */
        
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
        
        
    }

    private func addChildVc(storyName : String){
        
        //1.通过storyboard获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        //2.将childVc作为子控制器
        addChildViewController(childVc)
    }
    
}
