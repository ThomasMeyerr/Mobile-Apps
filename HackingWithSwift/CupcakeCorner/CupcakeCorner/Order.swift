//
//  Order.swift
//  CupcakeCorner
//
//  Created by Thomas Meyer on 10/06/2024.
//

import SwiftUI

extension String {
    var isWhiteSpaceOnly: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "streetAddress") {
            if let decodedData = try? JSONDecoder().decode(String.self, from: savedData) {
                streetAddress = decodedData
                return
            }
        }
        streetAddress = String()
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = Int()
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = String()
    var streetAddress = String() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(streetAddress) {
                UserDefaults.standard.set(encodedData, forKey: "streetAddress")
            }
        }
    }
    var city = String()
    var zip = String()
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        } else if name.isWhiteSpaceOnly || streetAddress.isWhiteSpaceOnly || city.isWhiteSpaceOnly || zip.isWhiteSpaceOnly {
            return false
        }
        return true
    }
    
    var cost: Double {
        // 2$ per cake
        var cost = Double(quantity) * 2
        
        // complicated cake cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
