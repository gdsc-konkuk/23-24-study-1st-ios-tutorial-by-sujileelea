//
//  AddMemberModal_Sample.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/21/23.
//

import SwiftUI

struct AddMemberModal_Sample: View {
    
    @Environment(\.dismiss) var dismiss
    
    var questions: [String] = ["이름", "닉네임", "MBTI", "생일", "좋아하는 색", "주량"]
    @Binding var members: [Member]
    //members에 추가할 새로운 멤버 인스턴스
    @State var newMember: Member = Member()
    @State private var showPicker: Bool = false
    @State private var profileImageData: Data? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                        addNewMember()
                    }, label: {
                        Text("저장")
                            .font(.system(size: 20))
                    })
                }
                .padding()
                VStack {
                    // [ 프로필 이미지 피커 ]
                    ImagePicker(member: $newMember)
                    // [ 세부 항목 ]
                    HStack {
                        VStack(alignment: .leading, spacing: 35) {
                            CustomTextField(question: "이름", textBinding: $newMember.name)
                            CustomTextField(question: "닉네임", textBinding: $newMember.nickname)
                            CustomTextField(question: "MBTI", textBinding: $newMember.mbti)
                            CustomTextField(question: "생일", textBinding: $newMember.birthday)
                            CustomTextField(question: "좋아하는 색", textBinding: $newMember.favoriteColor)
                            CustomTextField(question: "주량", textBinding: $newMember.drinkingCapacity)
                        }
                    }
                }
                .padding(.bottom, 40)
            }
        }
    }
    
    //반복되는 뷰 컴포넌트 재사용을 위한 ViewBuilder
    //질문 내용과 바인딩 값을 인자로 받는다. 추후 설명
    @ViewBuilder
    func CustomTextField(question: String, textBinding: Binding<String>) -> some View {
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
                    TextField("", text: textBinding)
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
    
    func addNewMember() {
        members.append(newMember)
    }
}
