//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Thomas Meyer on 12/07/2024.
//

import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations = [Location]()
        var selectedPlace: Location?
    }
}
