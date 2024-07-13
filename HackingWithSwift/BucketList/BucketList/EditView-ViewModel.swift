//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Thomas Meyer on 13/07/2024.
//

import Foundation

extension EditView {
    @Observable
    class ViewModel {
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var name: String
        var description: String
        var loadingState = LoadingState.loading
        var pages = [Page]()
        
        init(name: String = "", description: String = "") {
            self.name = name
            self.description = description
        }
    }
}
