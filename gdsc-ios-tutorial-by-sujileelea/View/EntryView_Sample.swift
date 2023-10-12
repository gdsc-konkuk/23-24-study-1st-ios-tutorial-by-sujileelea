//
//  EntryView_Sample.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

//뷰 구조체. View 프로토콜을 따르고 있습니다.
struct EntryView_Sample: View {
    
    //UI를 구현하는 body 인스턴스입니다.
    var body: some View {
        //뷰 컴포넌트들을 밑부터 쌓아올릴 수 있는 Stack
        ZStack {
            
            // [ 배경 ]
            //가장 밑에 깔릴 뷰 컴포넌트인 배경을 가장 먼저 ZStack 내부에 선언합니다.
            Image("EntryView_Background")
                //UI 상단의 SafeArea를 무시하고 화면 전체를 다 덮어버림. 한 번 지워보세요
                .ignoresSafeArea()
            
            //수직으로(vertical) 뷰 컴포넌트들을 정렬할 수 있는 Stack
            //spacing: VStack 내 컴포넌트 사이의 간격
            VStack(spacing: 140) {
                
                // [ 상단 로고 ]
                Image("GDSC_Symbol")
                    //Image("GDSC_Symbol") 영역에 국한되는 ZStack를 만듭니다
                    .overlay (
                        //alignment : VStack 내 뷰 컴포넌트 정렬
                        VStack(alignment: .leading, spacing: -15) {
                            Text("GDSC Konkuk .")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                //위 둘을 한 번에 다음과 같이 선언할 수 있습니다
                                .font(.system(size: 20, weight: .medium))
                            Text("iOS")
                                .font(.system(size: 90, weight: .bold))
                        }
                        //해당 VStack 내 컴포넌트의 표면 색을 전부 하얀색으로 통일
                            .foregroundColor(.white)
                    )
                
                // [ 입장하기 버튼 ]
                //둥글기(radius)가 있는 직사각형을 선언
                RoundedRectangle(cornerRadius: 40)
                    //크기
                    .frame(width: 320, height: 65)
                    //버튼의 표면색
                    .foregroundColor(.mainPurple)
                    .overlay(
                        Text("입장하기")
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                    )
                
                // [footer]
                Text("tutorial by sujilee")
                    //텍스트의 표면색을 하얀색으로 칠하고, 투명도를 70%로 조정합니다.
                    .foregroundStyle(.white.opacity(0.7))
                    //컴포넌트의 위치를 조정하는 방법은 여러가지가 있습니다.
                    //좌표로 조정해보죠.
                    .offset(y: 80)
            }
            //VStack과 그 안에 감싸인 컴포넌트들 전부 아래로 좀 내리고 싶네요.
            //VStack 상단에 패딩을 추가해 아래로 밀어봅시다.
            .padding(.top, 100)
        }
    }
}

//미리보기
#Preview {
    EntryView_Sample()
}
