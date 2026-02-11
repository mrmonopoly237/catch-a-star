//
//  NEOService.swift
//  NEOViewer
//

import Foundation

class NeoService {
    func fetchNEOs(mock: Bool) async throws -> [NearEarthObject] {
        let data: Data
        if mock {
            data = MockData.neoJSON
        }
        else {
            let urlString = "https://api.nasa.gov/neo/rest/v1/feed?start_date=2024-01-01&end_date=2024-01-07&api_key=DEMO_KEY"
            guard let url = URL(string: urlString) else { throw URLError(.badURL) }
            
            data = try await URLSession.shared.data(from: url).0
        }
        
        let response = try JSONDecoder().decode(NeoResponse.self, from: data)
        
        return response.nearEarthObjects.values.flatMap { $0 }
    }
}
