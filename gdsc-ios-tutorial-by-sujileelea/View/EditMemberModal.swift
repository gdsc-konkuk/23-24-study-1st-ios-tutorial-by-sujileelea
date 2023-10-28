//
//  AddMemberModal.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct EditMemberModal: View {
    @Environment(\.dismiss) private var dismiss
    
    let questions: [String] = ["이름", "닉네임", "MBTI", "생일", "좋아하는 색", "주량"]
    @Binding var member: Member
    
    var body: some View {
        VStack(spacing: 40) {
            // 저장 버튼
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }, label: {
                    Text("저장")
                        .font(.system(size: 21))
                        .foregroundStyle(Color(uiColor: UIColor(red: 0.32, green: 0.57, blue: 0.71, alpha: 1)))
                })
                
            }
            
            // 프로필 사진
            Image("Default_Profile_Image")
            
            // 정보
            VStack(spacing: 30) {
                CustomTextField(question: questions[0], inputText: $member.name)
                CustomTextField(question: questions[1], inputText: $member.nickname)
                CustomTextField(question: questions[2], inputText: $member.mbti)
                CustomTextField(question: questions[3], inputText: $member.birthday)
                CustomTextField(question: questions[4], inputText: $member.favoriteColor)
                CustomTextField(question: questions[5], inputText: $member.drinkingCapacity)
            }
        }
        .shadow(color: .black.opacity(0.25), radius: 2,x: 0, y: 4)
        .padding(.horizontal, 50)
    }
    
    @ViewBuilder
    func CustomTextField(question: String, inputText: Binding<String>) -> some View {
        HStack {
            Text(question)
                .foregroundStyle(.mainPurple)
            Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                TextField("", text: inputText)
                    .foregroundColor(.mainGray)
                Rectangle()
                    .frame(width: 180, height: 0.5)
                    .foregroundColor(.mainGray)
            }
            .frame(width: 180)
        }
        .font(.system(size: 20))
    }
}

#Preview {
    EditMemberModal(member: .constant(Member(name: "이수지", nickname: "sujilee", mbti: "ENTJ", birthday: "1206", favoriteColor: "보라색", drinkingCapacity: "1병 반")))
}
