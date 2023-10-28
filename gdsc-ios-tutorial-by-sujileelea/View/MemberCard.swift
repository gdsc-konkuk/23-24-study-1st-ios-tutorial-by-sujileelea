//
//  MemberCard.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct MemberCard: View {
    @State private var isShowing = false
    @Binding var member: Member
    
    var body: some View {
        VStack(spacing: 20) {
            // 수정 버튼
            HStack {
                Spacer()
                Button(action: {
                    isShowing = true
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 20))
                        .foregroundColor(.mainGray)
                })
                .popover(isPresented: $isShowing) {
                    EditMemberModal(member: $member)
                }
            }
            .padding()
            
            // 프로필 이미지
            Circle()
                .stroke(Color.mainPurple, lineWidth: 1)
                .frame(width: 200)
                
            
            // 이름
            VStack(spacing: 2) {
                Text(member.name)
                Text(member.nickname)
                RoundedRectangle(cornerRadius: 3)
                    .foregroundStyle(.mainPurple)
                    .frame(width: 100, height: 5)
            }
            .font(.system(size: 20))
            
            // 정보
            HStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("MBTI")
                        .fontWeight(.bold)
                    Text("생일")
                    Text("좋아하는 색")
                    Text("주량")
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    Text(member.mbti)
                    Text(member.birthday)
                    Text(member.favoriteColor)
                    Text(member.drinkingCapacity)
                }
                .foregroundColor(.mainGray)
            }
            .font(.system(size: 18))
            .padding()
        }
        .padding(30)
        .overlay(
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(Color.mainPurple, lineWidth: 1)
                .padding()
            
        )
        
    }
}

#Preview {
    MemberCard(member: .constant(Member(name: "이수지", nickname: "sujileelea", mbti: "ENTJ", birthday: "1206", favoriteColor: "보라색", drinkingCapacity: "1병 반")))
}
