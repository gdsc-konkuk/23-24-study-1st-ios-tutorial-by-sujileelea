//
//  AddMemberModal.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct AddMemberModal: View {
    
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
            VStack(spacing: 45){
                HStack {
                    Text("이름")
                        .foregroundColor(.mainPurple)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("박성근")
                        Rectangle()
                            .frame(width: 180, height: 1)
                    }
                }
                HStack {
                    Text("닉네임")
                        .foregroundColor(.mainPurple)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("seonggpa")
                        Rectangle()
                            .frame(width: 180, height: 1)
                    }
                }
                HStack {
                    Text("MBTI")
                        .foregroundColor(.mainPurple)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("ISFP")
                        Rectangle()
                            .frame(width: 180, height: 1)
                    }
                }
                HStack {
                    Text("생일")
                        .foregroundColor(.mainPurple)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("000801")
                        Rectangle()
                            .frame(width: 180, height: 1)
                    }
                }
                HStack {
                    Text("좋아하는 색")
                        .foregroundColor(.mainPurple)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("하늘색")
                        Rectangle()
                            .frame(width: 180, height: 1)
                    }
                }
                HStack {
                    Text("주량")
                        .foregroundColor(.mainPurple)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("1병")
                        Rectangle()
                            .frame(width: 180, height: 1)
                    }
                }
            }
            .font(.system(size: 20))
            .foregroundColor(.gray)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.25), radius: 0.1, x: 0, y: 4)
            .padding(45)
        }
    }
}

#Preview {
    AddMemberModal()
}

