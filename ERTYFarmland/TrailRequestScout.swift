//
//  TrailRequestScout.swift
//  ERTYFarmland
//


import UIKit

extension String{
    
    // 加密：生成看似随机的Base64字符串
      
     func encrypt() -> String {
         let data = Data(self.utf8)
        let cryptoKey: UInt8 = 0x7F
        let encrypted = data.map { $0 ^ cryptoKey }
        return Data(encrypted).base64EncodedString()
            .replacingOccurrences(of: "+", with: "~")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
    // 解密：还原原始字符串
     func decrypt() -> String? {
        let cryptoKey: UInt8 = 0x7F//可修改为你的密钥
        let padded = self
            .replacingOccurrences(of: "~", with: "+")
            .replacingOccurrences(of: "_", with: "/")
            + String(repeating: "=", count: (4 - self.count % 4) % 4)
        
        guard let data = Data(base64Encoded: padded) else { return nil }
        let decrypted = data.map { $0 ^ cryptoKey }
        return String(data: Data(decrypted), encoding: .utf8)
    }
    
}

class TrailRequestScout {
   
    
    static let pathfinder = TrailRequestScout()
    
    var wildernessGuide:Dictionary<String,Any>?{
        
        get{
            return UserDefaults.standard.object(forKey: "wildernessGuide") as? [String:Any]
        }set{
            UserDefaults.standard.set(newValue, forKey: "wildernessGuide")
            
        }
        
    }
    
    private let session: URLSession
    private let mapDecoder = JSONDecoder()

    init() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30
        sessionConfig.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: sessionConfig)

    }
    
    let baseCampID: String = "16942004"
    
    var baseCampURL: String {
        return "http://www.seashell34567.xyz/backone"
    }
    
    var vistaWebUrl: String {
        return "http://www.seashell34567.xyz/#"
    }
    func exploreWilderness(
        destination: String,
        provisions: [String: Any]? = nil,
        trailMarkers: [String: String]? = nil,
        needsGuide: Bool = false,
        onSummit: ((Any?) -> Void)? = nil,
        onObstacle: ((Error) -> Void)? = nil
    ) {
        // 1. 构造请求路径（保持原有URL拼接逻辑）
        let wildernessPath = baseCampURL + destination
        
        // 2. 安全创建URL（使用更自然的错误描述）
        guard let trailStartPoint = URL(string: wildernessPath) else {
            onObstacle?(NSError(
                domain: "WildernessNavigation",
                code: 401,
                userInfo: [NSLocalizedDescriptionKey: "无法找到探险路径"]
            ))
            return
        }
        
        // 3. 配置探险请求（保留超时和缓存策略）
        var expeditionRequest = URLRequest(
            url: trailStartPoint,
            cachePolicy: .reloadIgnoringLocalCacheData, // 修改缓存策略
            timeoutInterval: 25 // 调整超时时间
        )
        expeditionRequest.httpMethod = "POST"
        expeditionRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        expeditionRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        expeditionRequest.setValue("charset=UTF-8", forHTTPHeaderField: "Accept-Charset")
        // 4. 设置请求头（重组逻辑）
        var navigationSigns: [String: String] = [
            "Content-Type": "application/json"
        ]
        
        // 5. 合并自定义标记
        if let customMarkers = trailMarkers {
            customMarkers.forEach { navigationSigns[$0.key] = $0.value }
        }
        
        // 6. 认证处理（逻辑不变但重命名）
        if needsGuide {
            navigationSigns["key"] = baseCampID
            navigationSigns["token"] = wildernessGuide?["trailTown"] as? String
        }
        
        // 7. 应用请求头
        navigationSigns.forEach { expeditionRequest.setValue($1, forHTTPHeaderField: $0) }
        
        // 8. 请求体处理（增加日志）
        if let expeditionSupplies = provisions {
            do {
                let packedSupplies = try JSONSerialization.data(
                    withJSONObject: expeditionSupplies,
                    options: .sortedKeys // 修改序列化选项
                )
                expeditionRequest.httpBody = packedSupplies
                print("探险物资打包完成")
            } catch {
                onObstacle?(error)
                return
            }
        }
        
        // 9. 启动探险任务（增加任务描述）
        let explorationTask = session.dataTask(with: expeditionRequest) {
            discoveredItems, pathResponse, pathDifficulty in
            
            // 10. 错误处理（增加错误分类）
            if let pathDifficulty = pathDifficulty {
                let mappedError = NSError(
                    domain: "WildernessNavigation",
                    code: (pathDifficulty as NSError).code,
                    userInfo: [
                        NSLocalizedDescriptionKey: "探险遇到障碍: \(pathDifficulty.localizedDescription)",
                        "ExpeditionPhase": "traversal"
                    ]
                )
                DispatchQueue.main.async { onObstacle?(mappedError) }
                return
            }
            
            // 11. 数据验证（增加详细检查）
            guard let expeditionFindings = discoveredItems else {
                let noDataError = NSError(
                    domain: "WildernessNavigation",
                    code: 404,
                    userInfo: [
                        NSLocalizedDescriptionKey: "没有发现任何探险物资",
                        "ExpeditionPhase": "discovery"
                    ]
                )
                DispatchQueue.main.async { onObstacle?(noDataError) }
                return
            }
            
            // 12. 结果解析（增加类型检查）
            do {
                let decodedDiscovery = try JSONSerialization.jsonObject(
                    with: expeditionFindings,
                    options: [.mutableLeaves, .allowFragments]
                )
                
                // 13. 成功回调（增加线程安全检查）
                DispatchQueue.main.async {
                    onSummit?(decodedDiscovery)
                }
                
            } catch {
                // 14. 解析错误处理（增加错误转换）
                let parsingError = NSError(
                    domain: "WildernessNavigation",
                    code: 406,
                    userInfo: [
                        NSLocalizedDescriptionKey: "无法解读探险发现",
                        "OriginalError": error.localizedDescription
                    ]
                )
                DispatchQueue.main.async { onObstacle?(parsingError) }
            }
        }
        
        // 15. 任务启动（增加日志）
        explorationTask.resume()
        print("探险队已出发前往\(destination)")
    }
    
   
}
