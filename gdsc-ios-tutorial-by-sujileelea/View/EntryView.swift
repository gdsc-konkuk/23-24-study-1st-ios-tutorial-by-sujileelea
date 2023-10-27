//
//  EntryView.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
    // body ->
        NavigationStack {
            // 뷰 컴포넌트들을 밑부터 쌓아올릴 수 있는 Stack
            // 뷰 컴포넌트? : 화면 구성 요소
            // 1. 컴포넌트
            // => 조합하여 화면을 구성할 수 있는 블록을 의미, view를 구성하는 작은 조각들
            // => 레이아웃, 텍스트, 이미지, 버튼 등 다른 요소들을 각각 담당하며 사용자와 상호작용 하는 부분
            ZStack {
                // 맨 처음 깔릴 Ima
                Image("EntryView_Background")
    
                VStack {
                    // spacing -> 내부에 존재하는 컴포넌트 사이들의 간격
                    VStack(spacing: 140){
                        // GDSC Logo
                        Image("GDSC_Symbol")
                        // Image 내에 국한되는 ZStack을 제작 -> 올려놓는다고 생각하기
                            .overlay {
                                VStack(alignment: .leading, spacing: -15) {
                                    Text("GDSC Konkuk.")
                                        //.font(.system(size: 20))
                                        //.fontWeight(.medium)
                                        .font(.system(size:20, weight: .medium))
                                    Text("iOS")
                                        .font(.system(size: 100, weight: .bold))
                                }
                                // 해당 Stack 내 컴포넌트의 표면 색을 전부 하얀색으로 통일
                                // 즉 해당 Stack에는 Text밖에 없음 -> Text 색을 전부 하얀색으로 통일
                                .foregroundStyle(.white)
                            }
                        // Navigator -> 화면 간의 이동할 수 있도록 기능
                        // 스택으로 화면들을 쌓아올리면서 관리
                        // 만약 해당 link를 클릭하게 된다면 기존 entryview는 stack에 남아있는 상태로
                        // 다음 페이지인 memberlist를 push하게 되면서 스택 위에 쌓아올리게 됨.
                        // 뒤로 돌아가게 된다면 pop하게 되며 stack 최상단에서 해당 페이지를 삭제
                        // 이때, 기존 stack에 남아있는 page가 보여지게 됨.
                        // 왜 button으로 상호작용을 하지 않고 navigationlink를 쓰나?
                        // -> button을 통해 view를 관리하게 된다면 스택 설정부터 다 해야함.
                        NavigationLink(destination: MemberList(), label: {
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 306, height: 71)
                                .foregroundColor(.mainPurple)
                                .overlay {
                                    Text("입장하기")
                                        .font(.system(size: 23))
                                        .foregroundStyle(.white)
                                }
                        })
                    }
                    .padding(.top, 207)
                    // 빈 부분들을 알아서 채워주는 Spacer() 사용해서 footer 위치를 지정
                    // Sample에선 좌표로 직접 조적 -> position fixed 개념 사용
                    Spacer()
                    Text("tutorial by seonggpa")
                        .padding(.bottom)
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding(.bottom, 20)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    EntryView()
}

