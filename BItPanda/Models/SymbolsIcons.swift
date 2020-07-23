//
//  SymbolIcons.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation


final public class SymbolsIcons {
    public static var symbolIconsDictionaryDefault = [String: String]()
    public static var symbolIconsDictionaryDarkMode = [String: String]()
    public static func store(urlStr: String, for key: String, isDark: Bool = false) {
        if isDark {
             symbolIconsDictionaryDarkMode[key] = urlStr
        } else {
             symbolIconsDictionaryDefault[key] = urlStr
        }
       
    }
    
    public static func retrieveUrlStr(for key: String, isDark: Bool = false) -> String {
        let light = symbolIconsDictionaryDefault[key] ?? ""
        let dark = symbolIconsDictionaryDarkMode[key] ?? light
        return isDark ? dark : light
    }
}
