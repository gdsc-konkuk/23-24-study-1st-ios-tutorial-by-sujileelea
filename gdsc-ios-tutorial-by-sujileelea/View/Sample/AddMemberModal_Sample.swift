//
//  AddMemberModal_Sample.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct AddMemberModal_Sample: View {
    
    var contents: [String] = ["이름", "닉네임", "MBTI", "생일", "좋아하는 색", "주량"]
    
    //변수의 변화를 감지할 수 있는 프로퍼리 래퍼인 @State
    //중요 개념이기 때문에 추후 설명
    @State var name: String = ""
    @State var nickname: String = ""
    @State var mbti: String = ""
    @State var birthday: String = ""
    @State var favoriteColor: String = ""
    @State var drinkingCapacity: String = ""
    
    var body: some View {
        VStack {
            // [프로필 이미지 ]
            VStack {
                Image("Default_Profile_Image")
            }
            .padding()
            .padding(.vertical)
            // [ 세부 항목 ]
            HStack {
                VStack(alignment: .leading, spacing: 35) {
                    CustomTextField(content: "이름", textBinding: $name)
                    CustomTextField(content: "닉네임", textBinding: $nickname)
                    CustomTextField(content: "MBTI", textBinding: $mbti)
                    CustomTextField(content: "생일", textBinding: $birthday)
                    CustomTextField(content: "좋아하는 색", textBinding: $favoriteColor)
                    CustomTextField(content: "주량", textBinding: $drinkingCapacity)
                }
            }
            .padding()
        }
    }
    
    //반복되는 뷰 컴포넌트 재사용을 위한 ViewBuilder
    //질문 내용과 바인딩 값을 인자로 받는다. 추후 설명
    @ViewBuilder
    func CustomTextField(content: String, textBinding: Binding<String>) -> some View {
        HStack {
            //질문 내용
            VStack {
                Text(content)
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
                    Rectangle()
                        .frame(width: 200, height: 0.4)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    AddMemberModal_Sample()
}
