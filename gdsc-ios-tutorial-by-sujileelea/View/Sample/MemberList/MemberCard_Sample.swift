//
//  MemberCard.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct MemberCard_Sample: View {
    
    @Binding var showEditMemberModal: Bool
    var questions: [String] = ["MBTI", "생일", "좋아하는 색", "주량"]
    @Binding var member: Member
    
    var body: some View {
        VStack {
            // [수정 버튼]
            HStack {
                Spacer()
                Button(action: {
                    showEditMemberModal = true
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 25))
                        .foregroundColor(.gray)
                })
                .padding(.top, -20)
                .padding(-10)
                .offset(x: 20)
            }
            // [ 프로필 사진 ]
            ImagePicker(member: $member).profileImage
            //이미지의 사이즈를 내가 원하는대로 재조정
                .resizable()
            //추후 설명
                .scaledToFill()
                .frame(width: 230, height: 230)
            //이미지를 Circle() 모양으로 자름
                .clipShape(Circle())
            //사진 테두리
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                )
            //그림자 색 및 반경 조절
                .shadow(color: .mainPurple, radius: 1)
            // [ 이름 및 닉네임 ]
            VStack {
                Text(member.name)
                Text(member.nickname)
                Rectangle()
                //모서리 둥근 정도
                    .cornerRadius(3)
                    .frame(width: 120, height: 4)
                    .foregroundColor(.mainPurple)
                    .padding(.top, -5)
            }
            .font(.system(size: 22, weight: .medium))
            .padding(.vertical)
            // [ 세부정보 ]
            HStack(spacing: 100) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(questions, id: \.self) { question in
                        Text(question)
                            .fontWeight(.semibold)
                    }
                }
                VStack(alignment: .trailing, spacing: 10) {
                    Text(member.mbti)
                    Text(member.birthday)
                    Text(member.favoriteColor)
                    Text(member.drinkingCapacity)
                }
            }
            .font(.system(size: 19))
            .offset(y: 10)
        }
        .padding(67)
        // [ 카드 테두리 ]
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.mainPurple.opacity(0.9), lineWidth: 0.9)
            //ScrollView에 침범당하는 것을 방지하는 패딩
                .padding()
        )
        .sheet(isPresented: $showEditMemberModal, content: {
            EditMemberModal_Sample(member: $member)
        })
    }
}
