//
//  CPProfileBarView.swift
//  Cinephile
//
//  Created by Setu Desai on 2/5/24.
//

import SwiftUI

struct CPProfileBarView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
            HStack(alignment: .top, spacing: 20) {
                CPPosterImageView(moviePosterUrlString: "/fRbJHsykSRLbRYNrCyaP2YATeDG.jpg")
                    .scaledToFill()
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(10)
                    .clipShape(Capsule(style: .circular))
                VStack(alignment: .leading, spacing: 8) {
                    Text("Setu Desai")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Text("Member Since 2019")
                        .font(.footnote)
                        .fontWeight(.light)
                        .lineLimit(5)
                        .multilineTextAlignment(.leading)
                    Text("Liked Movies - 20")
                        .font(.footnote)
                        .fontWeight(.light)
                        .lineLimit(5)
                        .multilineTextAlignment(.leading)
                    Text("Watched Movies - 200")
                        .font(.footnote)
                        .fontWeight(.light)
                        .lineLimit(5)
                        .multilineTextAlignment(.leading)
                } .padding([.top, .bottom], 5)
            }.padding(10)
        }
        .padding(.bottom, 5)
    }
}

#Preview {
    CPProfileBarView()
}
