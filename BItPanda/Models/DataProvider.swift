//
//  DataProvider.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

public protocol DataProviderProtocol {
    var masterData: MasterData { get }
}

final public class DataProvider: DataProviderProtocol {
    static public let shared = DataProvider()
    
    private var _masterData: MasterData?
    
    public var masterData: MasterData {
        if DataProvider.shared._masterData == nil {
            if let url = Bundle.main.url(forResource: "Masterdata", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(MasterPayloadFileData.self, from: data)
                    DataProvider.shared._masterData = jsonData.data.attributes
                    
                    let all = DataProvider.shared.masterData.cryptocoins + DataProvider.shared.masterData.commodities + DataProvider.shared.masterData.fiats
                    all.forEach {
                        SymbolsIcons.store(urlStr: $0.iconWhite, for: $0.symbol)
                    }
                    print("")
                } catch {
                    print("error:\(error.localizedDescription)")
                }
            }
        }
        return DataProvider.shared._masterData ?? .empty
    }
}
