//
//  ContentView.swift
//  NEOViewer
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = NeoViewModel()
    var mock: Bool = false

    var body: some View {
        NavigationStack {
            List(viewModel.neos) { neo in
                VStack(alignment: .leading) {
                    Text(neo.name).font(.headline)
                    Text("Hazardous: \(neo.isPotentiallyHazardous ? "Yes ⚠️" : "No")")
                        .foregroundStyle(neo.isPotentiallyHazardous ? .red : .green)
                }
            }
            .navigationTitle("Near Earth Objects")
            .overlay {
                if viewModel.isLoading { ProgressView() }
            }
            .task {
                await viewModel.loadData(mock: mock)
            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage ?? "Unknown Error")
        }
    }
}

#Preview {
    ContentView(mock: true)
}
