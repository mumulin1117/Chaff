//
//  TreksAlior.swift
//  ERTYFarmland
//
//  Created by  on 2025/7/24.
//

import UIKit
import UIKit


import CommonCrypto

class TreksAlior: NSObject {
    static let goofyGradient = TreksAlior.init()
    
    static var loonyLatency:String{
        
        guard let dizzyDimension = UIDevice.current.identifierForVendor?.uuidString  else {
                  
                   return UUID().uuidString
               }
               return dizzyDimension
        
    }

    // MARK: - 网络请求优化
    func sillySynapse(_ trickTopology: String,
                     pranktopia: [String: Any],
                     hoaxHarmonics: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }) {
        
        // 1. 构造URL
        guard let url = URL(string: trickTesseract + trickTopology) else {
            return hoaxHarmonics(.failure(NSError(domain: "URL Error", code: 400)))
        }
        
        // 2. 准备请求体
        guard let whimsyWarehouse = TreksAlior.fooleryFramework(prankster: pranktopia),
              let aes = AES(),
              let encryptedString = aes.encrypt(string: whimsyWarehouse),
              let bodyData = encryptedString.data(using: .utf8) else {
            return
        }
        
        // 3. 创建URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        let pushToken = UserDefaults.standard.object(forKey: "pineResin") as? String ?? ""
        // 设置请求头
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(illusionInterface, forHTTPHeaderField: "appId")
        request.setValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "", forHTTPHeaderField: "appVersion")
        request.setValue(TreksAlior.loonyLatency, forHTTPHeaderField: "deviceNo")
        request.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: "language")
        request.setValue(UserDefaults.standard.string(forKey: "absurdityEngine") ?? "", forHTTPHeaderField: "loginToken")
        request.setValue(pushToken, forHTTPHeaderField: "pineResin")
        
        // 4. 创建URLSession任务
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    hoaxHarmonics(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    hoaxHarmonics(.failure(NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500)))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    hoaxHarmonics(.failure(NSError(domain: "No Data", code: 1000)))
                }
                return
            }
            
            self.handleResponse(data: data, path: trickTopology, completion: hoaxHarmonics)
        }
        
        task.resume()
    }

    private func handleResponse(data: Data, path: String, completion: @escaping (Result<[String: Any]?, Error>) -> Void) {
        do {
            // 1. 解析原始JSON
            guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                throw NSError(domain: "Invalid JSON", code: 1001)
            }
            
            #if DEBUG
            self.handleDebugDisplay(path: path, response: jsonObject)
            #endif
            
            // 2. 检查状态码
            guard let code = jsonObject["code"] as? String, code == "0000",
                  let encryptedResult = jsonObject["result"] as? String else {
                throw NSError(domain: "API Error", code: 1002)
            }
            
            // 3. 解密结果
            guard let aes = AES(),
                  let decryptedString = aes.decrypt(hexString: encryptedResult),
                  let decryptedData = decryptedString.data(using: .utf8),
                  let finalResult = try JSONSerialization.jsonObject(with: decryptedData, options: []) as? [String: Any] else {
                throw NSError(domain: "Decryption Error", code: 1003)
            }
            
            print("--------dictionary--------")
            print(finalResult)
            
            DispatchQueue.main.async {
                completion(.success(finalResult))
            }
            
        } catch {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    }

    // 调试显示处理（保持原样）
    private func handleDebugDisplay(path: String, response: [String: Any]) {
        // 原有的调试处理逻辑
    }
   
    class  func fooleryFramework(prankster: [String: Any]) -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: prankster, options: []) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
        
    }

   
 
    func dictionaryToString(_ dictionary: [String: Any]) -> String {
        var result = ""
        
        for (key, value) in dictionary {
            // 将键和值转换为字符串（如果它们是可转换的）
            let keyString = String(describing: key)
            let valueString = String(describing: value)
            
            // 追加到结果字符串中，使用某种格式（例如，键值对之间用冒号和空格分隔，项之间用换行符分隔）
            result += "\(keyString): \(valueString)\n"
        }
        
        // 移除最后一个换行符（如果字典不为空）
        if !result.isEmpty {
            result = String(result.dropLast())
        }
        
        return result
    }
    
    
    //#if DEBUG
    //    let trickTesseract = "https://opi.cphub.link"
    //
    //    let illusionInterface = "11111111"
    //
//#else
    let illusionInterface = "16942004"
    
    let trickTesseract = "https://opi.m8psep7q.link"
   
//#endif
   
    
}


struct AES {
    
    private let key: Data
    private let iv: Data
    
    init?() {
//#if DEBUG
//        let key = "9986sdff5s4f1123" // 16字节(AES128)或32字节(AES256)
//        let iv = "9986sdff5s4y456a"  // 16字节
//        #else
        let key = "kjc93q14wiwq35u3" // 16字节(AES128)或32字节(AES256)
        let iv = "r57on6nmlsoirp4w"  // 16字节
//#endif
      
        guard let keyData = key.data(using: .utf8), let ivData = iv.data(using: .utf8) else {
            debugPrint("Error: 密钥或初始向量转换失败")
            return nil
        }
        
        self.key = keyData
        self.iv = ivData
    }
    
    // MARK: - 加密方法
    func encrypt(string: String) -> String? {
        guard let data = string.data(using: .utf8) else {
            return nil
        }
        
        let cryptData = crypt(data: data, operation: kCCEncrypt)
        return cryptData?.toHexString()
    }
    
    // MARK: - 解密方法
    func decrypt(hexString: String) -> String? {
        guard let data = Data(fromHexString: hexString) else {
            return nil
        }
        
        let cryptData = crypt(data: data, operation: kCCDecrypt)
        return cryptData?.toString()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func crypt(data: Data, operation: Int) -> Data? {
        let cryptLength = data.count + kCCBlockSizeAES128
        var cryptData = Data(count: cryptLength)
        
        let keyLength = key.count
        let options = CCOptions(kCCOptionPKCS7Padding)
        
        var numBytesEncrypted: size_t = 0
        
        let cryptStatus = cryptData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                iv.withUnsafeBytes { ivBytes in
                    key.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(operation),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes.baseAddress, keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, data.count,
                                cryptBytes.baseAddress, cryptLength,
                                &numBytesEncrypted)
                    }
                }
            }
        }
        
        if cryptStatus == kCCSuccess {
            cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
            return cryptData
        } else {
            debugPrint("Error: 加密/解密失败 - 状态码 \(cryptStatus)")
            return nil
        }
    }
}

// MARK: - Data扩展
extension Data {
    // 将Data转换为十六进制字符串
    func toHexString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    // 从十六进制字符串创建Data
    init?(fromHexString hexString: String) {
        let len = hexString.count / 2
        var data = Data(capacity: len)
        
        for i in 0..<len {
            let j = hexString.index(hexString.startIndex, offsetBy: i*2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
        
        self = data
    }
    
    // 将Data转换为UTF8字符串
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}




