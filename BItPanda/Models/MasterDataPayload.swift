//
//  MasterDataPayload.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

public struct MasterPayloadFileData: Decodable {
    let data: MasterPayloadData
}

public struct MasterPayloadData: Decodable {
    let type: String
    let attributes: MasterData
}

public struct MasterData: Decodable {
    let cryptocoins: [Asset]
    let commodities: [Asset]
    let fiats: [Asset]
    let wallets: [Wallet]
    let comoditiesWallets: [Wallet]
    let fialWallets: [Wallet]
    
    enum CodingKeys: String, CodingKey {
        case cryptocoins
        case commodities
        case fiats
        case wallets
        case comoditiesWallets = "commodity_wallets"
        case fialWallets = "fiatwallets"
    }
}

public enum AssetType: String, Decodable, CaseIterable {
    case cryptocoin
    case commodity
    case fiat
}
    
public struct Asset: Decodable {
    let id: String
    let type: AssetType
    let iconWhite: String
    let iconBlack: String
    let name: String
    let symbol: String
    let precision: Int
    let hasWallets: Bool?
    let averagePrice: Decimal?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
    }
    
    enum AttributesKeys: String, CodingKey {
        case iconWhite = "logo"
        case iconBlack = "logo_dark"
        case name
        case symbol
        case averagePrice = "avg_price"
        case precision
        case hasWallets = "has_wallets"
        case presisionForFiat = "precision_for_fiat_price"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        type = try values.decode(AssetType.self, forKey: .type)
        
        let attributes = try values.nestedContainer(keyedBy: AttributesKeys.self, forKey: .attributes)
        iconWhite = try attributes.decode(String.self, forKey: .iconWhite)
        iconBlack = try attributes.decode(String.self, forKey: .iconBlack)
        name = try attributes.decode(String.self, forKey: .name)
        symbol = try attributes.decode(String.self, forKey: .symbol)
        if let averagePriceString = try attributes.decodeIfPresent(String.self, forKey: .averagePrice) {
            averagePrice = Decimal(string: averagePriceString)
        } else {
            averagePrice = nil
        }
        let precision1 = try attributes.decodeIfPresent(Int.self, forKey: .precision) ?? 0
        let precision2 = try attributes.decodeIfPresent(Int.self, forKey: .presisionForFiat)
        precision = precision2 ?? precision1
        hasWallets = try attributes.decodeIfPresent(Bool.self, forKey: .hasWallets)
    }
}

public enum WalletType: String, Decodable, CaseIterable {
    case wallet
    case fiatWallet = "fiat_wallet"
}

public struct Wallet: Decodable {
    let id: String
    let type: WalletType
    let name: String
    let symbol: String
    let balance: Decimal
    let isDeleted: Bool
    let isDefault: Bool
    let icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
    }
    
    enum AttributesKeys: String, CodingKey {
        case name
        case symbol = "cryptocoin_symbol"
        case fiatSymbol = "fiat_symbol"
        case balance
        case isDeleted = "deleted"
        case isDefault = "is_default"
        case icon
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        type = try values.decode(WalletType.self, forKey: .type)
        
        let attributes = try values.nestedContainer(keyedBy: AttributesKeys.self, forKey: .attributes)
        name = try attributes.decode(String.self, forKey: .name)
        let symbolStr = try attributes.decodeIfPresent(String.self, forKey: .symbol)
        let fiatSymbolStr = try attributes.decodeIfPresent(String.self, forKey: .fiatSymbol)
        symbol = symbolStr ?? fiatSymbolStr ?? ""
        let balanceString = try attributes.decodeIfPresent(String.self, forKey: .balance) ?? ""
        balance = Decimal(string: balanceString) ?? 0
        isDeleted = try attributes.decodeIfPresent(Bool.self, forKey: .isDeleted) ?? false
        isDefault = try attributes.decodeIfPresent(Bool.self, forKey: .isDefault) ?? false
        icon = nil
    }
}

extension MasterData {
    static let empty = MasterData(cryptocoins: [], commodities: [], fiats: [], wallets: [], comoditiesWallets: [], fialWallets: [])
}
