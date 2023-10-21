//
//  AddMemberModal_Sample.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct EditMemberModal_Sample: View {
    
    @Environment(\.dismiss) var dismiss
    
    var questions: [String] = ["이름", "닉네임", "MBTI", "생일", "좋아하는 색", "주량"]
    
    //변수의 변화를 감지할 수 있는 프로퍼리 래퍼인 @State
    //중요 개념이기 때문에 추후 설명
    @Binding var member: Member
    @State private var showPicker: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("저장")
                            .font(.system(size: 20))
                    })
                }
                .padding()
                // [프로필 이미지 ]
                VStack {
                    ImagePicker(member: $member)
                }
                .padding()
                .padding(.vertical)
                // [ 세부 항목 ]
                HStack {
                    VStack(alignment: .leading, spacing: 35) {
                        CustomTextField(question: "이름", content: member.name, textBinding: $member.name)
                        CustomTextField(question: "닉네임", content: member.nickname, textBinding: $member.nickname)
                        CustomTextField(question: "MBTI", content: member.mbti, textBinding: $member.mbti)
                        CustomTextField(question: "생일", content: member.birthday, textBinding: $member.birthday)
                        CustomTextField(question: "좋아하는 색", content: member.favoriteColor, textBinding: $member.favoriteColor)
                        CustomTextField(question: "주량", content: member.drinkingCapacity, textBinding: $member.drinkingCapacity)
                    }
                }
            }
            .padding(.bottom, 40)
        }
    }
    
    //반복되는 뷰 컴포넌트 재사용을 위한 ViewBuilder
    //질문 내용과 바인딩 값을 인자로 받는다. 추후 설명
    @ViewBuilder
    func CustomTextField(question: String, content: String, textBinding: Binding<String>) -> some View {
        HStack {
            //질문 내용
            VStack {
                Text(question)
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(.mainPurple)
            }
            //답변 내용
            HStack {
                Spacer()
                VStack(spacing: 1.5) {
                    TextField(content, text: textBinding)
                        .frame(width: 200)
                        .foregroundColor(.mainGray)
                        .font(.system(size: 20))
                        .onAppear {
                            UIApplication.shared.hideKeyboard()
                        }
                    Rectangle()
                        .frame(width: 200, height: 0.4)
                }
            }
        }
        .padding(.horizontal)
    }
}
