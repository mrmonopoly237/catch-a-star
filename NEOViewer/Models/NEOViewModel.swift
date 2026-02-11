//
//  NEOViewModel.swift
//  NEOViewer
//

import Foundation
import Observation

@Observable
@MainActor
class NeoViewModel {
    var neos: [NearEarthObject] = []
    var isLoading = false
    var showError = false
    var errorMessage: String?
    
    private let service = NeoService()
    
    func loadData(mock: Bool) async {
        isLoading = true
        errorMessage = nil
        
        do {
            neos = try await service.fetchNEOs(mock: mock)
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
