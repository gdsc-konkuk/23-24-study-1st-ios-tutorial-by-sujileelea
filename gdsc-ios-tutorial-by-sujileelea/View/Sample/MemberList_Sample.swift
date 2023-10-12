//
//  TeamIntroduction_Sample.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct MemberList_Sample: View {
    
    @State var showAddMemberModal: Bool = false
    
    var questions: [String] = ["MBTI", "생일", "좋아하는 색", "주량"]
    var answers: [String] = ["ENTJ", "941206", "보라색", "1병 반"]
    
    var body: some View {
        VStack {
            //[ 배너 ]
            HStack {
                VStack(alignment: .leading) {
                    Text("팀 소개")
                        .font(.system(size: 30, weight: .black))
                        .foregroundStyle(.mainPurple)
                    Text("지존 iOS")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.mainPurple.opacity(0.7))
                }
                .padding(.leading, 10)
                Spacer()
            }
            //HStack 주변의 패딩
            .padding()
            .background(RoundedRectangle(cornerRadius: 35).fill(Color.mainPurple.opacity(0.2)))
            //배너 배경 주변의 패딩
            .padding()
            .padding(.bottom, 25)
            .padding(.top, 40)
            // [ 멤버 카드 목록 ]
            ScrollView {
                VStack {
                    MemberCard_Sample()
                }
            }
        }
        // [ 화면 상단 툴바 ]
        .toolbar(content: {
            //멤버 등록 모달을 띄우는 값 트리거
            Button(action: {
                showAddMemberModal = true
            }, label: {
                Text("+")
                    .font(.system(size: 20))
            })
        })
        // 모달 뷰를 띄우기 위한 modifier
        //isPresented: 트리거, content: 띄울 뷰
        .sheet(isPresented: $showAddMemberModal, content: {
            AddMemberModal_Sample()
        })
    }
}

#Preview {
    MemberList_Sample()
}
