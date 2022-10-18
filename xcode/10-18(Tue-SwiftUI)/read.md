
- 10-17,18(월,화)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/98c5c55c-059f-468b-8678-b4f662886af0/Untitled.png)

## 🔸UIKit vs SwiftUI

SwiftUI 장점

- live preview 제공
- 선언적 구문(decorative syntax)
- 데이터 주도(data driven)

- 우수한 앱, 더 적은 코드
- 디자인 도구
- 모든 애플 플랫폼 지

## 🔸SwiftUI의 선언적 구문

명령형 구문과 선언형 구문

1. 강남역 2호선에서 CU 교대역점 앞 횡단보도까지 3개의 횡단보도를 지나 약 1.02km 이동
2. 횡단보도를 이용해 베스킨라빈스 교대역 방면으로 횡단
3. 스타벅스 교대역점 횡단보도까지 1개의 횡단보도를 지나 약 345m 이동
4. 횡단보도를 이용하여 롯데하이마트 교대역점 방면으로 횡단
5. 교대역까지 약 44m 이동

선언형 구문

1.강남역 교대역까지 도보로 이동

- interface Builder와 같은 별도의 레이아웃 설계도구와 그 산출물인 XIB 또는 StoryBoard에 의존하지않음
- 화면을 구성하는 컴퍼넌트들의 레이아웃과 모양에 대한 세부 사항을 직접 설계하는 고민과 시간 절약
- SwiftUI는 단순하면서도 직관적인 구문을 이용하여 화면을 설계할 수 있게 해준다.
- 레이아웃이 실제로 구축되는 방식의 복잡함을 고민할 필요 없음
- 사용자 인터페이스가 어떤 모양이어야 하는지 코드를 사용해 선언하는 방식으로 레이아웃 생성

---

1.기본적으로 레이아웃에 포함될 컴퍼넌트 선언

2.컴퍼넌트에 포함될 레이아웃 매니저 종류 명시

- VStack,HStack,Form,List

3.속성을 설정하기위한 수정자(modifier)사용

- 버튼의 텍스트, 레이블의 전면 색상, 또는 탭 제스처 이벤트의 호출 메소드

- 이렇게 선언하면 모든 복잡한 세부사항은 swiftUI가 자동으로 처리한다.
    - 레이아웃 위치와 강제사항, 렌더링 방법
    
    ---
    
- SwiftUI는 선언은 계층적 구조화되어 있다.
- 작고 재사용 가능한 하위 VIew를 사용자 정의로 만ㄷ르어 복잡한 View 구성도 가능ㅎ다ㅏ.
- Xcode Preivew canvas로 코딩 순간마다 실시간 변경되는 레이아웃 확인과 테스트 가능

---

## 🔸SwiftU는 데이터 주도적이다

## 🔸UIKit과 MVC 모델

- **MVC**는 사용자 인터페이스, 데이터 및 논리 제어를 구현하는데 널리 사용되는 소프트웨어 디자인 패턴입니다.
- 소프트웨어의 비즈니스 로직과 화면을 구분하는데 중점을 두고 있습니다.
- 이러한 “관심사 분리”는 더나은 업무의 분리와 향상된 관리를 제공합니다.
    - **모델**: 데이터와 비즈니스 로직을 관리합니다.
    - **뷰**: 레이아웃과 화면을 처리합니다.
    - **컨트롤러**:명령을 모델 뷰 부분으로 라우팅합니다.
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/08203fcf-128b-426e-ab7b-fb01ded99f55/Untitled.png)
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/42238f8b-34c6-4beb-bdb3-b979924df5c8/Untitled.png)
    
    ---
    
    ## 🔸MVVM의 유행
    
- ViewModel은 View의 추상화 계층입니다. 뷰모델은 뷰를 알지 못하고 단지 **Notify**만 하게 됩니다. 등록된 뷰가 이를 확인하고 스스로 결과를 반영하여 사용자에게 보여줍니다.
- MVVM이 MVP에 비해 갖는 장점은 여기에 있습니다. 프레젠터는 UI종속적인 코드를 제거했지만 결국 뷰 자체를 참조해야만 합니다. 그렇기 때문에 플랫폼에 종속적인 구조를 가질 수 밖에 없습니다. 하짐나 뷰모델은 아예 뷰를 참조할 필요가 없이 그냥 자신이 할 일만 하면 됩니다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2e0cdace-0026-4a5b-a86d-8b4185633691/Untitled.png)

- RxSwift
    - UI이벤트 중심으로 클로저를 활용해 코드를 단순화
    - 바인딩된 데이터를 변경함녀 관련된 화면 요소는 자동으로 갱신
    
    ---
    
    ## 🔸SwiftUI는 데이터 주도적이다
    
    data driven
    
- 데이터 주도는 앱 데이터와 사용자  인터페이스 및 로직 사이의 관계에서 본것이다.
- UIkit에서 앱 안의 현재 데이터를 살펴보려면 관련 코드를 직접 작성해야 했다.
    - 데이터가 변경되면 그 변경이 화면에 나타나도록 하는 코드를 직접 작성해야 했다.
    - 필요하면 주기적으로 데이터 변경을 확인해 반영하도록 코들르 작성해야 했다.
- SwiftUI는 앱의 데이터 모델과 사용자 인터페이스 컴포넌트, 그리고 기능을 제공하는 로직을 Binding하는 여러 방법으로 복잡도를 낮춰준다.

---

- 데이터 주도로 구현하면 데이터 모델은 애브이 다른 부분에서 구독할 수 있는 데이터 변수를 게시하게 된다.
- 이러한 방법을 통해 데이터가 변경되었다는 사실을 모든 구독자에게 바로 알릴 수 있다.
- 만약 사용자 인터페이스 컴퍼넌트와 데이터 모델간에 바인딩이 된다면, 추가적인 코드를 작성하지 않아도 모든 데이터의 변경 사항을 SwiftUI가 사용자 인터페이스에 자동으로 반영할 것이다.

---

[Apple Developer Documentation](https://developer.apple.com/documentation/swiftui)

 

```swift
Button("Hello", action: {
                print("전기차를 충전해주세요")
            })
            
            Button("Hello") {
                print("전기차를 충전해주세요")
            }
            
            Button(action: {
                print("전기차를 충전해주세요")
            }, label: {
                Image(systemName: "bolt.car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            })
            
            Button(action: {
                print("전기차를 충전해주세요")
            }) {
                Image(systemName: "bolt.car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
```
