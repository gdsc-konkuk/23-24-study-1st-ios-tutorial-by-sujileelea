//
//  AddMemberModal.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct MemberInfo: Identifiable {
    var id: String { name }
    let name: String
    let content: String
}

struct EditMemberModal: View {
    
    var memberInfo: [MemberInfo] = [
        MemberInfo(name: "이름", content: "이수지"),
        MemberInfo(name: "닉네임", content: "sujilee"),
        MemberInfo(name: "MBTI", content: "ENTJ"),
        MemberInfo(name: "생일", content: "941206"),
        MemberInfo(name: "좋아하는 색", content: "보라색"),
        MemberInfo(name: "주량", content: "1병 반")]
    
    var body: some View {
        VStack(spacing: 40) {
            // 저장 버튼
            HStack {
                Spacer()
                Text("저장")
                    .font(.system(size: 21))
                    .foregroundStyle(Color(uiColor: UIColor(red: 0.32, green: 0.57, blue: 0.71, alpha: 1)))
            }
            
            // 프로필 사진
            Image("Default_Profile_Image")
            
            // 정보
            ForEach(memberInfo) { item in
                HStack {
                    Text(item.name)
                        .foregroundStyle(.mainPurple)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 3) {
                        Text(item.content)
                            .foregroundStyle(.mainGray)
                        Rectangle()
                            .frame(width: 180, height: 0.5)
                            .foregroundColor(.mainGray)
                    }
                }
                .font(.system(size: 20))
                
            }
        }
        .shadow(color: .black.opacity(0.25), radius: 2,x: 0, y: 4)
        .padding(.horizontal, 50)
    }
}

#Preview {
    EditMemberModal()
}
