//
//  MargotUIScreen.swift
//  Margot
//
//  Created by CatHarly on 2018/11/30.
//

import Foundation

/*
 640 × 1136   16:9   iPhone5s          Default-568h@2x
 
 750 × 1334   16:9   iPhone6 7 8       Default-667h@2x
 
 1242 × 2208  16:9   iPhone8 Plus      Default-736h@3x
 
 1125 × 2436  18:9   iPhoneX, XS       Default-812h@3x
 
 828 x 1792   19.5:9   iPhoneXR         Default-828h@2x
 
 1242 x 2688  18:9   iPhoneX Max       Default-1242h@3x
 */

public struct Screen {
    
    /// Screen width
    public var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Screen height
    public var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// is iphoneX
    public var isIphoneX: Bool {
        return UIScreen.main.bounds.height >= 812
    }
    
    /// NavigationBar height
    public var iphoneXNavBarHeight: CGFloat {
        return isIphoneX ? 88.0:64.0
    }

    /// StatusBar height
    public var iphoneXStatusBarHeight: CGFloat {
        return isIphoneX ? 44.0:20.0
    }

    /// Top safe area
    public var iphoneXStatusBarMargin: CGFloat {
        return isIphoneX ? 24.0:0.0
    }

    /// Bottom safe area
    public var iphoneXBottomMargin: CGFloat {
        return isIphoneX ? 34.0:0.0
    }
    
    public var scaleW: CGFloat {
        return width/375.0
    }
    
    public var scaleH: CGFloat {
        return height/667.0
    }
    
    public var scaleWH: CGFloat {
        return width/height
    }
    
    /// Common scale
    public var scale: CGFloat {
        return UIScreen.main.scale
    }
}
