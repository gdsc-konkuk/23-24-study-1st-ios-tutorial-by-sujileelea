//
//  MemberCard.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/12/23.
//

import SwiftUI


struct MemberCard: View {
    
    @State var showEditMemberModal: Bool = false;
    
    var infoList: [String] = ["MBTI", "생일", "좋아하는 색", "주량"]
    var answers: [String] = [Member().mbti, Member().birthday, Member().favoriteColor, Member().drinkingCapacity]
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.cyan.opacity(0.7), lineWidth: 1)
                .frame(width: 340, height: 630)
                .foregroundColor(.white)
                .overlay {
                    VStack {
                        // 수정 항목 추가
                        HStack {
                            Spacer()
                            Button(action: {
                                showEditMemberModal = true;
                            }, label: {
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 30))
                                    .foregroundColor(.mainGray)
                            })
                        }
                        .padding(.trailing, 30)
                        .padding(.top, 30)
                        Spacer()
                        Image("profile_image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 206, height: 206)
                            .clipShape(Circle())
                            .overlay { // 그림 위에 원을 올려서 해당 테두리를 밖으로 빠져 보이게
                                Circle()
                                    .stroke(Color.white, lineWidth: 4)
                            }
                            .shadow(color: Color.cyan, radius: 1)
                            .padding(.bottom)
                        VStack {
                            // Kor Name
                            Text(Member().name)
                            // Eng Name
                            Text(Member().nickname)
                        }
                        .font(.system(size: 20))
                        RoundedRectangle(cornerRadius: 3)
                            .frame(width: 110, height: 5)
                            .foregroundColor(.cyan)
                            .padding(.bottom, 40)
                        HStack (spacing: 75){
                            VStack(alignment: .leading){
                                //Foreach
                                // 각 item의 id를 정해주도록 할 수 있음.
                                // Array 내부 요소가 가지고 있는 값 자체를 id로 가지게 해줌.
                                // [MBTI, 생일, 색, 주량] 각각의 요소에 id를 부여
                                // id 부여 안할 시에 랄지랄지 함 -> Identifiable 프로토콜을 만족안한다고 판단하기 때문.
                                ForEach(infoList, id: \.self) {
                                    question in
                                    Text(question)
                                        .fontWeight(.semibold)
                                }
                            }
                            VStack(alignment: .trailing) {
                                ForEach(answers, id: \.self){
                                    answer in
                                    Text(answer)
                                }
                            }
                        }
                        Spacer()
                    }
                }
        }
        // showEditMemberModal
        .sheet(isPresented: $showEditMemberModal, content: {
            EditMemberModal();
        })
    }
}

#Preview {
    MemberCard()
}

