//
//  TeamIntroduction.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct MemberList: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Image(systemName: "plus")
                    .frame(alignment: .topTrailing)
            }
            .padding(20)
            
            Rectangle()
                .frame(width: 340, height: 84)
                .cornerRadius(25)
                .foregroundColor(.mainPurple.opacity(0.16))
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text("팀 소개")
                                .foregroundStyle(Color.mainPurple)
                                .font(.system(size: 32, weight: .semibold))
                            Text("지존 iOS")
                                .foregroundStyle(Color.mainPurple.opacity(0.7))
                                .font(.system(size: 19, weight: .semibold))
                        }
                        Spacer()
                    }
                        .padding()
                )
//                .padding()
          
            ScrollView {
                MemberCard()
            }
        }
    }
}

#Preview {
    MemberList()
}
