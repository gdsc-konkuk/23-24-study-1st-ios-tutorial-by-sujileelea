//
//  EntryView.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("EntryView_Background")
                VStack(spacing: 150) {
                    Spacer()
                    ZStack {
                        Image("GDSC_Symbol")
                            .frame(width: 306, height: 146)
                        Text("GDSC Konkuk.")
                            .font(.system(size: 20))
                            .frame(width: 162, height: 121, alignment: .top)
                        Text("iOS")
                            .font(.system(size: 100))
                            .frame(width: 169, height: 121)
                    }
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    
                    NavigationLink(destination: {
                        MemberList()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 306, height: 71)
                                .foregroundColor(.mainPurple)
                                .cornerRadius(40)
                            Text("입장하기")
                                .foregroundStyle(.white)
                                .font(.system(size: 23))
                        }
                    })
                    Spacer()
                    Text("tutorial by sujilee")
                        .foregroundStyle(.white)
                        .font(.footnote)
                        .frame(alignment: .bottom)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    EntryView()
}
