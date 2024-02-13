//
//  CPLateralScrollView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import SwiftUI

struct CPLateralScrollView: View {
    
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .frame(alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible(minimum: 100, maximum: 120))]) {
                    ForEach(0..<5) {_ in
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                                .overlay(alignment: .bottom) {
                                    Text("Title")
                                        .frame(width: 100)
                                        .font(.footnote)
                                        .lineLimit(2)
                                }
                                .frame(width: 100, height: 100)
                        }
                    }
                }.padding(10)
            }.frame(height: 110)
        }
    }
}

#Preview {
    CPLateralScrollView(title: "")
}
//
//  CPLateralScrollView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/12/24.
//

import Foundation
