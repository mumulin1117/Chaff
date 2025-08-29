//
//  Journeylaylists.swift
//  ERTYFarmland
//
//  Created by  on 2025/8/29.
//

import UIKit

class Journeylaylists: NSObject {
    
    // 钥匙串服务标识符
       private static let service: String = {
           return Bundle.main.bundleIdentifier ?? "com.hikeout.chaff"
       }()
       
       // 账户标识符
       private static let deviceIDAccount = "chaff_device_id"
       private static let passwordAccount = "chaff_user_password"
       
       // MARK: - 设备ID管理
       
       /// 获取或创建设备唯一标识符
       static func getOrCreateDeviceID() -> String {
           // 首先尝试从钥匙串读取
           if let existingID = readFromKeychain(account: deviceIDAccount) {
               print("-----------existingID---------------")
               print(existingID)
               return existingID
           }
           
           // 生成新的ID
           let newDeviceID = generateDeviceID()
           
           // 保存到钥匙串
           saveToKeychain(value: newDeviceID, account: deviceIDAccount)
           print("-----------newDeviceID---------------")
           print(newDeviceID)
           return newDeviceID
       }
       
//       /// 生成设备ID
       private static func generateDeviceID() -> String {
           return UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
       }
       
       // MARK: - 密码管理
       
       /// 保存用户密码到钥匙串
       static func saveUserPassword(_ password: String) {
           saveToKeychain(value: password, account: passwordAccount)
       }
       
       /// 从钥匙串获取用户密码
       static func getUserPassword() -> String? {
           return readFromKeychain(account: passwordAccount)
       }
       
       /// 删除用户密码
       static func deleteUserPassword() {
           deleteFromKeychain(account: passwordAccount)
       }
       
       // MARK: - 通用钥匙串操作方法
       
       /// 从钥匙串读取数据
       private static func readFromKeychain(account: String) -> String? {
           let query: [String: Any] = [
               kSecClass as String: kSecClassGenericPassword,
               kSecAttrService as String: service,
               kSecAttrAccount as String: account,
               kSecReturnData as String: true,
               kSecMatchLimit as String: kSecMatchLimitOne
           ]
           
           var result: AnyObject?
           let status = SecItemCopyMatching(query as CFDictionary, &result)
           
           guard status == errSecSuccess,
                 let data = result as? Data,
                 let value = String(data: data, encoding: .utf8) else {
               return nil
           }
           
           return value
       }
       
       /// 保存数据到钥匙串
       private static func saveToKeychain(value: String, account: String) {
           // 先删除可能存在的旧值
           deleteFromKeychain(account: account)
           
           guard let data = value.data(using: .utf8) else { return }
           
           let query: [String: Any] = [
               kSecClass as String: kSecClassGenericPassword,
               kSecAttrService as String: service,
               kSecAttrAccount as String: account,
               kSecValueData as String: data,
               kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
           ]
           
           SecItemAdd(query as CFDictionary, nil)
       }
       
       /// 从钥匙串删除数据
       private static func deleteFromKeychain(account: String) {
           let query: [String: Any] = [
               kSecClass as String: kSecClassGenericPassword,
               kSecAttrService as String: service,
               kSecAttrAccount as String: account
           ]
           
           SecItemDelete(query as CFDictionary)
       }
       
       // MARK: - 清理方法
       
       /// 删除所有存储的数据（用于退出登录或测试）
       static func clearAllData() {
           deleteFromKeychain(account: deviceIDAccount)
           deleteFromKeychain(account: passwordAccount)
       }
       
       /// 检查是否已有设备ID（用于判断是否首次安装）
       static func hasDeviceID() -> Bool {
           return readFromKeychain(account: deviceIDAccount) != nil
       }
       
       /// 检查是否已保存密码（用于判断是否已登录）
       static func hasUserPassword() -> Bool {
           return readFromKeychain(account: passwordAccount) != nil
       }
}
