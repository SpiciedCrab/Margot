//
//  MargotSystem.swift
//  Margot
//
//  Created by CatHarly on 2018/11/29.
//

import Foundation

/// Margot Basics
public struct Margot {
    
    /// System definitions like infos in .plist/iOS version
    public static let system = SystemInfo()
    
    /// Formates: decimal/date
    public static let formatters = Formatters()
    
    /// Screen sizes
    public static let screen = Screen()
}

public struct Formatters {
    
    /// Common NumberFormatter
    public var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        return formatter
    }()
    
    /// Common DateFormatter -> "YY-MM-dd hh:mm:ss"
    public var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd hh:mm:ss"
        formatter.locale = .current
        return formatter
    }()
}

public struct SystemInfo {
    
    private let appInfo = Bundle.main.infoDictionary ?? [:]
    
    /// app version
    public var appVersion: String {
        if let version = appInfo["CFBundleShortVersionString"] as? String {
            return version
        }
        return ""
    }
    
    /// app Build
    public var appBuild: String {
        return  appInfo["CFBundleVersion"] as? String ?? ""
    }
    
    /// iOS systemVersion
    public var deviceOSVersion: String {
        return UIDevice.current.systemVersion
    }
    
    /// iOS UUID
    public var deviceUUID: String {
        
        if let uuid = UserDefaults.standard.value(forKey: "UUID") as? String {
            return uuid
        } else {
            if let currentDeviceUUID = UIDevice.current.identifierForVendor {
                var  uuid = currentDeviceUUID.uuidString
                uuid = uuid.replacingOccurrences(of: " ", with: "")
                UserDefaults.standard.setValue(uuid, forKey: "UUID")
                UserDefaults.standard.synchronize()
                return uuid
            }
        }
        return ""
    }
    
    /// iOS appName
    public var appName: String {
        return appInfo["CFBundleDisplayName"] as? String ?? ""
    }
    
    /// iOS8
    public var isSystem8: Bool {
        return deviceOSVersion.double >= 8.0
    }
    
    /// iOS9
    public var isSystem9: Bool {
        return deviceOSVersion.double >= 9.0
    }
    
    /// iOS10
    public var isSystem10: Bool {
        return deviceOSVersion.double >= 10.0
    }
    
    /// iOS11
    public var isSystem11: Bool {
        return deviceOSVersion.double >= 11.0
    }
    
    /// iOS12
    public var isSystem12: Bool {
        return deviceOSVersion.double >= 12.0
    }
    
    /// is iphone
    public static var isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
