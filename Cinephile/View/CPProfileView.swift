//
//  CPProfileView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/4/24.
//

import SwiftUI

struct CPProfileView: View {
    var body: some View {
        NavigationStack {
            List {
                CPProfileBarView()
                    .listRowSeparator(.hidden)
                CPLateralScrollView(title: "Favorites")
                CPLateralScrollView(title: "To Be Watched")
                CPLateralScrollView(title: "Watching")
            }
            .navigationTitle("Profile")
            .listStyle(.plain)
        }
    }
}

#Preview {
    CPProfileView()
}
