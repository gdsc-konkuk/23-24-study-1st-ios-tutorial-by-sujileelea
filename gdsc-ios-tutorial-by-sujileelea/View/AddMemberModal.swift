//
//  AddMemberModal.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct AddMemberModal: View {
    
    // 반복되는
    var contents: [String] = ["이름", "닉네임", "MBTI", "생일", "좋아하는 색", "주량"]
    
    @State var name: String = ""
    @State var nickname: String = ""
    @State var mbti: String = ""
    @State var birth: String = ""
    @State var color: String = ""
    @State var alcohol: String = ""
    
    var body: some View {
        VStack {
            // Image Box
            Image("Default_Profile_Image")
                .resizable()
                .scaledToFill()
                .frame(width: 201, height: 201)
                .overlay {
                    HStack{
                        Spacer()
                        //Image Edit button
                        Button(action: {
                            // Image Picker
                        }, label: {
                            VStack{
                                Spacer()
                                Image(systemName: "pencil.circle.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                            }
                        })
                    }
                }
                .padding(.bottom, 30)
            // Korean Info
            // 반복되는 구현 -> 함수화하기
            // 가로 정렬된 HStack을 겹겹히 쌓을 것
            HStack {
                VStack {
                    CustomTextField(content: "이름", textBinding: $name)
                }
            }
            .font(.system(size: 20))
            .foregroundColor(.gray)
            .padding(45)
        }
    }
    
    @ViewBuilder
    func CustomTextField(content: String, textBinding: Binding<String>) -> some View {
        HStack {
            VStack {
                Text(content)
            }
            HStack {
                TextField("", text: textBinding)
                Rectangle()
            }
        }
    }
}

#Preview {
    AddMemberModal()
}
