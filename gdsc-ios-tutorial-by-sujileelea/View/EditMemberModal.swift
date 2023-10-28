//
//  AddMemberModal.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct EditMemberModal: View {
    
    @Environment(\.dismiss) private var dismiss
    
    // 반복되는
    var contents: [String] = ["이름", "닉네임", "MBTI", "생일", "좋아하는 색", "주량"]
    
    @State var name: String = Member().name
    @State var nickname: String = Member().nickname
    @State var mbti: String = Member().mbti
    @State var birthday: String = Member().birthday
    @State var favoriteColor: String = Member().favoriteColor
    @State var drinkingCapacity: String = Member().drinkingCapacity
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    // Save Input Data & Close
                    dismiss()
                }, label: {
                    Text("저장")
                })
            }
            .padding(.top, 60)
            .padding(.trailing, 20)
            Spacer()
            // Image Box
            Image("profile_image")
                .resizable()
                .scaledToFit()
                .frame(width: 201, height: 201)
                .clipShape(Circle())
                .overlay {
                    HStack{
                        Spacer()
                        //Image Edit button
                        Button(action: {
                            // Image Picker
                            // Album 접근 권한 설정. How?
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
                VStack(spacing: 44) {
                    CustomTextField(content: "이름", textBinding: $name)
                    CustomTextField(content: "닉네임", textBinding: $nickname)
                    CustomTextField(content: "MBTI", textBinding: $mbti)
                    CustomTextField(content: "생일", textBinding: $birthday)
                    CustomTextField(content: "좋아하는 색", textBinding: $favoriteColor)
                    CustomTextField(content: "주량", textBinding: $drinkingCapacity)
                }
            }
            .font(.system(size: 20))
            .foregroundColor(.gray)
            .padding(40)
        }
        // 왜 toolbar가 안뜰까?
        //        .toolbar {
        //            ToolbarItem(content: {
        //                Text("저장")
        //                    .font(.system(size: 20))
        //            })
        //        }
    }
    
    @ViewBuilder
    func CustomTextField(content: String, textBinding: Binding<String>) -> some View {
        HStack {
            VStack {
                Text(content)
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(.mainPurple)
            }
            HStack {
                Spacer()
                VStack {
                    TextField("", text: textBinding)
                        .frame(width: 200)
                        .foregroundColor(.mainGray)
                        .font(.system(size: 20))
//                        .onChange(of: textBinding.wrappedValue) { newValue, _ in
//                            textBinding.wrappedValue = newValue // 값을 업데이트
//                        }
                    Rectangle()
                        .frame(width: 200, height: 0.5)
                }
            }
        }
    }
}

#Preview {
    EditMemberModal()
}
