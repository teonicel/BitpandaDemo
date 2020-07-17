//
//  SymbolIcons.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation


final public class SymbolsIcons {
    public static var symbolIconsDictionary = [String: String]()
    public static func store(urlStr: String, for key: String) {
        symbolIconsDictionary[key] = urlStr
    }
    
    public static func retrieveUrlStr(for key: String) -> String {
        return symbolIconsDictionary[key] ?? ""
    }
}
