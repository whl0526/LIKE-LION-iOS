
- 10-20(목-SwiftUI)
    
    ## 🔸Team10 MiracleRandomNum (Up & Down Game)
    
<img width="442" alt="Untitled (8)" src="https://user-images.githubusercontent.com/67450169/196968306-f1157e4c-19a5-440c-a216-a9899d9d7d20.png">![image](https://user-images.githubusercontent.com/67450169/196968007-80e41310-be5e-4c60-b73a-b2753a3b58b9.png)    
    ```swift
    //
    //  ContentView.swift
    //  MiracleRandom
    //
    //  Created by Martin on 2022/10/20.
    //
    
    import SwiftUI
    
    //userNumber == "" ? "" : array[arrayIndex]
    //randomNumber == 0 ? "랜덤 숫자를 먼저 만들어주세요" : "랜덤 숫자가 만들어졌습니다"
    
    //1. 랜덤넘버를 가져오는 버튼을 누른다.
    // 랜덤넘버가 0으로 되어있으면 텍스트 필드랑 제출버튼 비활성화
    
    //2. 유저가 번호를 입력한다.
    // 유저가 아무것도 입력을 하지 않을때
    // userNumber.isEmpty로 파악
    
    //3. 유저가 버튼을 눌러서 정답을 확인
    //4. 정답이 나올때까지 2 -3 반복
    //5. 정답을 맞추면 축하 -> 초기화
    struct ContentView: View {
        //랜덤숫자 스테이트
        
        let labelTexts: [String] = ["정답", "정답보다 작은 숫자입니다.", "정답보다 큰 숫자입니다.", "입력 값이 잘못되었습니다", ""]
        
        
        @State private var labelIndex: Int = 4
        @State private var randomNumber: Int = 0
        @State private var userNumber: String = ""
        @State private var count: Int = 0
        
        var body: some View {
            VStack {
                
                if labelIndex == 0 {
                    AsyncImage(url: URL(string:   "https://media.discordapp.net/attachments/1019072261854081044/1032522053317820477/unknown.png")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 300, height: 300)
                }
                
    
                
                //랜덤 숫자 생성하는 버튼
                randomNumber == 0 ?
                Button("Random") {
                    randomNumber = Int.random(in: 1...100)
                    print(randomNumber)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.orange)
                
                :
                Button("Retry") {
                    randomNumber = 0
                    count = 0
                    userNumber = ""
                    labelIndex = 4
                }
                .buttonStyle(.bordered)
                .foregroundColor(.orange)
                
            
                
                //MARK: 정보
                //정답인지 오답인지
                Text(labelTexts[labelIndex])
                //시도횟수
                Text("시도횟수: \(count)")
                
                //MARK: 입력 텍스트필드
                TextField("1부터 100사이의 숫자를 입력하세요", text: $userNumber)
                    .multilineTextAlignment(.center)
                
                //MARK: 제출버튼
                Button("Submit") {
                    // 사용자가 입력한 값을 Int로 바꿔서 비교
                    guard let userNumber = Int(userNumber) else {
                        labelIndex = 3
                        return
                    }
                    
                    
                    
                    switch userNumber {
                    case randomNumber:
                        labelIndex = 0
                        print("일치")
                        count += 1
                    case 1 ..< randomNumber :
                        labelIndex = 1
                        print("작음")
                        count += 1
                    case (randomNumber + 1)...100:
                        labelIndex = 2
                        print("큼")
                        count += 1
                    case ...0, 100...:
                        labelIndex = 3
                        print("범위밖")
                    default :
                        print("디폴트")
                    }
                    
                    
                  
                }
                .buttonStyle(.bordered)
                .foregroundColor(.orange)
                .disabled(randomNumber == 0 )
                .disabled(userNumber.isEmpty)
                
                
                
            }
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    //1. 특정한 숫자 규칙을 만든다 (예를 들어 1~99사이의 정수)
    //2. 랜덤숫자를 만들고 보여주지 않는다
    //3. 사용자는 텍스트 입력이나 화면에 버튼을 누르는 등의 다양한 방법으로 숫자를 입력한다
    //4. 랜덤 숫자를 맞추면 화려하고 아름다운 축하 메시지를 보여주고 다음판을 진행한다
    //5. 숫자를 맞추지 못하면 "더 큰 숫자" 또는 "더 적은 숫자"인 상황을 알려준다 (옵션)
    ```
