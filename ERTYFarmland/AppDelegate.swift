//
//  AppDelegate.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

@main

///sj/user/selectUserIndexList 10.查询用户列表
///sj/dynamic/selectDynamicList 查询帖子/动态
///sj/dynamic/updateDynamicStore 喜欢、取消喜欢帖子
///sj/user/updateUserRelation 用户关系处理
///sj/message/selectMessageInfo 查询消息通知-IOS
///sj/user/selectUserInfo 查询用户的详细信息
///sj/user/getUseInfo 获取当前用户信息
///sj/user/selectUserBalance  查询用户余额
///sj/user/emailLogin 账号登录注册

//http://www.seashell34567.xyz
//"1.pages/DynamicDetails/index?dynamicId=  // 动态详情  动态ID
//2.pages/ReleaseDynamic/index  // 发布动态
//3.pages/screenplay/index  // AI创作
//4.pages/CreateRole/index  // AI虚拟角色
//5.pages/privateChat/index?userId=  // 私聊 用户ID (拨打视频时增加参数 CallVideo=1 )
//6.pages/HomePage/index?userId=  // 他人主页  用户ID
//7.pages/Setting/index  // 设置
//8.pages/EditData/index  // 编辑资料
//9.pages/attention/index?type=  // 1互关 2 关注 3粉丝 4黑名单
//10.pages/Agreement/index?type=1 //用户协议
//11.pages/Agreement/index?type=2 //隐私政策
//12.pages/Report/index //举报页面
//13.pages/VoucherCenter/index //充值页面
//14.pages/VideoDetails/index?dynamicId= //视频详情 动态ID
//15.pages/releaseVideos/index //发布视频"


class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

