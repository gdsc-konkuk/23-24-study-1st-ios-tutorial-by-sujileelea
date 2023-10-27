//
//  TeamIntroduction.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct MemberList: View {
    
    @State var showAddMemberModal: Bool = false
    
    var body: some View {
        // 배너 제작
        VStack {
            HStack(spacing: 0) {
                // Left Bar
                Rectangle()
                    .frame(width: 6, height: 84)
                    .foregroundStyle(.cyan)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 340, height: 84)
                    .opacity(0.16)
                    .overlay {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("팀 소개")
                                    .font(.system(size: 32))
                                Text("iOS")
                                    .font(.system(size: 20))
                                    .opacity(0.8)
                            }
                            .padding(.leading)
                            Spacer()
                        }
                    }
                    .foregroundStyle(.cyan)
                }
        }
        // scrollbar 띄우는 게 싫어서 showIndicators false로 지정
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MemberCard()
            }
        }
        .padding()
        
        // EditMemberCard_Modal
        .toolbar(content: {
            Button(action: {
                showAddMemberModal = true
            }, label: {
                Text("+").font(.system(size: 20))
            })
        })
        
        .sheet(isPresented: $showAddMemberModal, content: {
            EditMemberModal();
        })
    }
}

#Preview {
    MemberList()
}

