
- 10-06(목-**Objective-C**)
    
       ![Untitled - 2022-10-06T174114 526](https://user-images.githubusercontent.com/67450169/194265205-14a78013-81c6-4186-ac1b-950b889b6a2b.png)

    ## 🔸개요
    
    Overview
    
    - 오브젝티브-C는 C프로그래밍 언어 위에 스몰토크 프로그래밍 언어의 기능을 추가해 객체지향 언어로 만든 범용 언어입니다.
    - 처음에 Objective-C는 NeXT가 **NeXTSTEP** OS용으로 개발했으며 Apple이 인수해서 iOS 및 Mac OS X용으로 활용중입니다.
    
    ---
    
    ## 🔸객체 지향 프로그래밍
    
    - objective-C는 객체지향 개발의 4가지 기둥을 포함하여 객체 지향 프로그래밍을 완벽하게 지원합니다.
        - 캡슐화(encapsulation)
        - 데이터 은닉(Data hiding)
        - 상속(inheritance)
        - 다형성(polymorphism)
        
        ---
        
        ```objectivec
        #import <Foundation/Foundation.h>
        
        int main (int argc, const char * argv[])
        {
           NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
        
           NSLog (@"hello world");
           [pool drain];
           return 0;
        }
        ```
        
        ### objective- C “hello world” 출력
        
         
        
        ---
        
        ## 🔸기초 프레임워크
        
        Foundation Framework
        
    - Foundation Framework는 다양한 기능을 제공하며 아래에 나열되어 있습니다.
        - 여기에는 NSArray, NSDictionary, NSSet 등과 같은 확장 데이터 타입 목록이 포함된다.
        - 파일, 문자열 등을 조작하는 풍부한 기능 세트로 구성됩니다.
        - URL 처리, 날짜 형식 지정, 데이터 처리, 오류 처리 등과 같은 유틸리티를 위한 기능을 제공합니다.
        
        ---
        
        ## 🔸프로그램 구조
        
        - objective-c 프로그램은 기본적으로 다음 부분으로 구성된다.
            - 전처리기 명령  —>본격 코드 전에 먼저 처리할 것들
            - 인터페이스  —> 이거만 봐도 호출해서 사용할 수 있게함
            - 구현
            - 메소드
            - 변수
            - 진술 및 표현
            - 주석 /* */
            
            ---
            
            ```swift
            //swift
            import Foundation
            
            struct SampleClass {
                func sampleMethod(){
                    print("hello, world")
                }
            }
            
            let sampleClass = SampleClass()
            sampleClass.sampleMethod()
            ```
            
            ```objectivec
            //objective-c
            #import <Foundation/Foundation.h>
            
            //선언부
            @interface SampleClass:NSObject
            -(void)sampleMethod;
            @end
            
            //구현부
            @implemetation SampleClass
            -(void)sampleMethod{
                NSLog(@"hello, world\n");
            }
            @end
            
            int main(){
               SampleClass *sampleClass = [[SampleClass alloc]init]
               [sampleClass sampleMethod];
               return 0;
            }
            ```
            
            ---
            
    
    ## 🔸예약어
    
    - 다음 목록은 Objective-C의 일부 예약어를 보여준다.
    - 이러한 예약어는상수나 변수 또는 기타 식별자 이름으로 사용할 수 없습니다.
    
   ![Untitled - 2022-10-06T174118 085](https://user-images.githubusercontent.com/67450169/194265242-bdd5dc4e-9379-4fde-9306-3a69cdb0f77e.png)
    
    ## 🔸데이터 타입
    
    - objective-c 프로그래밍 언어에서 데이터 타입은 다양한 타입의 변수 또는 함수를 선언하는ㄴ데 사용되는 광범위한 시스템
    - 변수의 타입은 저장공간에서 차지하는 공간과 저장된 비트 패턴이 해석되는 방식을 결정한다.
    - objective-c의 타입은 다음과 같이 분류할 수 있다.
    
    ![Untitled - 2022-10-06T174119 608](https://user-images.githubusercontent.com/67450169/194265256-f6e608a7-b7cc-4394-b4b6-57c627065763.png)
    ---
    
    ## 🔸정수 타입
    
    ![Untitled - 2022-10-06T174120 828](https://user-images.githubusercontent.com/67450169/194265267-0ada9724-d232-42ea-81e4-90472fcd79d3.png)
    
    ## 🔸부동소수점 타입
    
   ![Untitled - 2022-10-06T174122 606](https://user-images.githubusercontent.com/67450169/194265281-ffec07b5-bebf-452f-a22f-84936fbaee3b.png)
    
    ## 🔸void 타입
    
   ![Untitled - 2022-10-06T174124 122](https://user-images.githubusercontent.com/67450169/194265291-399d5ca9-8efd-40bb-8142-b43424e3915c.png)
    
    ---
    
    ![Untitled - 2022-10-06T174125 504](https://user-images.githubusercontent.com/67450169/194265300-24eacaa5-b62e-4f0e-a02e-059e7ce81e6f.png)
    
    ```objectivec
    char : 1
    unsigned char : 1
    signed char : 1
    int : 4
    unsigned int : 4
    short : 2
    unsigned short : 2
    long : 8
    unsigned long : 8
    float : 4
    double : 8
    long double : 16 
    
    ```
    
    ---
    
    ## 🔸변수의 정의
    
    - 변수 정의는 컴파일러에게 변수에 대한 저장소를 생성할 위치와 양을 알려주는 것을 의미한다.
    - 변수 정의는 데이터 유형을 지정하고 다음과 같이 해당 유형의 하나 이상의 변수 목록을 포함한다.
    
![Untitled - 2022-10-06T174127 744](https://user-images.githubusercontent.com/67450169/194265320-84303fe3-4567-4942-91b4-b6df8cfb0bc3.png)    
    ---
    
    - 변수는 선언에서 초기화 할 수 있습니다.
    - 이니셜라이저는 등호와 다음과 같은 상수 표현식으로 구성됩니다.
    - 이니셜라이저가 없는 정의의 경우: 정적 저장 기간이 있는 변수는 암시적으로 NULL로 초기화 됩니다
        - 모든 바이트 값은 0
    - 다른 모든 변수의 초기 값을 정의되지 않습니다.
    
  ![Untitled - 2022-10-06T174129 556](https://user-images.githubusercontent.com/67450169/194265337-1c22f4c5-31f1-49cf-92c9-70fb192bf582.png)
    
    ---
    
    ## 🔸변수 선언
    
    - 변수 선언은 컴파일러가 변수에 대한 완전한 세부 정보 없이 추가 컴파일을 진행할 수 있또록 주어진 유형 및 이름을 가진 하나의 변수가 존재한다는 보증을 컴파일러에 제공한다.
    - 변수 선언은 컴파일 시에만 의미가 있으며 컴파일러는 프로그램 연결 시 실제 변수 선언이 필요하다.
    - 변수 선언은 여러 파일을 사용하고 파일 중 하나에 변수를 정의할 때 유용하다
    - 이 파일은 프로그램을 연결할 때 사용할 수 있다. **extern** 키워드를 사용하여 어느 곳에서나 변수를 선언한다.
    
   ![Untitled - 2022-10-06T174131 119](https://user-images.githubusercontent.com/67450169/194265349-238ca074-ae9e-4a67-b106-619eab33b4d2.png)
    
    ---
    
    - 선언 시 함수 이름을 제공하고 실제 정의가 다른 곳에서 제공될 수 있는 함수 선언에도 동일한 개념이 적용됩니다.
    - 다음 예제에서는 C함수를 사용하여 설명하며 objective-c는 c 스타일 함수도 지원합니다.
    
    ![Untitled - 2022-10-06T174132 622](https://user-images.githubusercontent.com/67450169/194265358-1731cbce-95e7-4576-a57f-05fb6568c6d0.png)
    
    ---
    
    ## 🔸L값 표현식 & R값 표현식
    
    ![Untitled - 2022-10-06T174134 150](https://user-images.githubusercontent.com/67450169/194265364-ca629982-671a-47f7-8e4b-fa7a4f17af11.png)
    
    ## 🔸상수
    
    - 상수는 프로그램이 실행 중에 변경할 수 없는 고정 값을 나타냅니다. 이러한 고정 값은 리터럴 이라고도 한다.
    - 상수는 정수 상수, 부동 상수, 문자 상수 또는 문자열 리터럴과 같은 기본 데이터 유형 중 하나일 수 있습니다. 열거형 상수도 있다.
    - 상수는 정의 후에 값을 수정할 수 없다는 점을 제외하고는 변수처럼 취급된다.
    
    ---
    
    ## 🔸정수 리터럴  → 대표적인 c언어 상수
    
    - 정수 리터럴은 10진수, 8진수 또는 16진수 상수일 수 있습니다. 접두사는 기수 또는 기수를 지정합니다.
    - 16진수의 경우 0x 또는 0X, 8진수의 경우 0, 10진수의 경우 아무것도 지정하지 않습니다.
    - 정수 리터럴은 unsigned 및 long에 대해 각각 U와 L의 조합인 접미사를 가질 수도 있습니다. 접미사는 대문자 또는 소문자가 될 수 있으며 임의의 순서가 될 수 있습니다.
    - **다음의 정수 리터럴의 몇가지 예이다.**
    
   ![Untitled - 2022-10-06T174135 613](https://user-images.githubusercontent.com/67450169/194265387-94e63d29-6fb1-4cc0-ad9b-1f8e1cb6e58d.png)
    
    ## 🔸부동 소수점 리터럴
    
    - 부동 소수점 리터럴에는 정수부분, 소수점, 소수부분 및 지수부분이 있습니다. 소수점 형식이나 지수 형식으로 부동소수점 리터럴을 나타낼 수 있습니다.
    - 소수점 형식을 사용하여 나타낼 때는 소수점, 지수 또는 둘다를 포함해야 하고 지수 형식을 사용하여 나타낼 때는 정수 부분, 소수 부분 또는 둘다를 포함해야 합니다. 부호 있는 지수는 e 또는 E로 시작합니다.
    - 다음은 부동 소수점 리터럴의 몇가지 예입니다.
    
    ![Untitled - 2022-10-06T174136 994](https://user-images.githubusercontent.com/67450169/194265400-f729a7ac-6253-40af-a58d-06b60b0ee600.png)
    ---
    
    ## 🔸문자상수
    
    - 문자 리터럴은 작은 따옴표(예:’x’)로 묶여 있으며 char 유형의 단순 변수에 저장할 수 있습니다.
    - 문자 리터럴은 일반 문자(예:’x’), 이스케이프 시퀀스(예:’\t’) 또는 범용 문자(예:’\u02C0’)일 수 있따.
    - C에서 백슬래시로 이어지는 특정 문자는 특별한 의미를 가지며 개행(\n) 또는 탭(\t)과 같이 표시하는데 사용됩니다. 여기에 이러한 이스케이프 시퀀스 코드의 일부 목록이 있습니다.
    
    ![Untitled - 2022-10-06T174138 598](https://user-images.githubusercontent.com/67450169/194265412-114cff1b-47d6-4f6c-a6db-9ababd156d2d.png)
    ---
    
    ## 🔸문자상수
    
    - 문자열 리터럴 또는 상수는 큰따옴표 “”로 묶입니다.
    - 문자열에는 일반 문자, 이스케이프 시퀀스 및 범용 문자와 같은 문자 리터럴과 유사한 문자가 포함됩니다.
    - 문자열 리터럴을 사용하여 긴 줄을 여러줄로 나누고 공백을 사용하여 구분할 수 있습니다.
    - 다음은 문자열 리터럴의 몇가지 예입니다. 세가지 형식은 모두 동일한 문자열 입니다.
    
    ---
    
    ## 🔸상수정의
    
    - C에서 상수를 정의하는 두 가지 간단한 방법이 있습니다.
        - #define 전처리기 사용.
        - const 키워드를 사용.
    
    ---
    
    ## 🔸#define 전처리기 —> compile 완료 전에 먼저
    
    #define identifier value 
    
    **#ifdef**
    
    **#endif**
    
    ## 🔸const 키워드
    
    - **const** 접두사를 사용하여 다음과 같이 특정 유형의 상수를 선언 할 수 있습니다.
    
    const type variable = value;
    
    ![Untitled - 2022-10-06T174140 897](https://user-images.githubusercontent.com/67450169/194265428-e8532ac6-040f-42d8-834b-959756c5d2c3.png)
    
    ## 🔸연산자
    
    - 연산자는 컴파일러에게 특정 수학적 또는 논리적 조작을 수행하도록 지시하는 기호입니다.
    - objective-c언어는 내장 연산자가 풍부하며 다음 유형의 연산자를 제공합니다.
    
    ## 🔸산술 연산자
    
    - 변수 A가 **10**을 보유하고 변수 B가 **20**을 보유하고 있다고 가정하
    
    ![Untitled - 2022-10-06T174142 594](https://user-images.githubusercontent.com/67450169/194265443-6a14bff9-bb69-4590-a257-802ba3e2725b.png)
    
    ---
    
    ## 🔸관계 연산자
    
    - 변수 A가 **10**을 보유하고 변수 B가 **20**을 보유하고 있다고 가정하면
    
   ![Untitled - 2022-10-06T174144 143](https://user-images.githubusercontent.com/67450169/194265449-4fd3e2b0-7ba4-4dc3-9f1b-a83a2f71e743.png)
    
    ## 🔸논리 연산자
    
    - 변수 A가 **1**을 보유하고 변수 B가 **0**을 보유하고 있다고 가정하면
    
   ![Untitled - 2022-10-06T174145 471](https://user-images.githubusercontent.com/67450169/194265461-6fedb2f4-4e3c-4a41-95cf-267612d879bb.png)
    
    ## 🔸비트 연산자
    
   ![Untitled - 2022-10-06T174147 183](https://user-images.githubusercontent.com/67450169/194265473-dda45d3b-dbb0-4c79-9c61-e1c85ff47525.png)
    
   ![Untitled - 2022-10-06T174148 817](https://user-images.githubusercontent.com/67450169/194265482-7f29369d-ab82-4b5e-b4f8-c00cce9e87d0.png)
    
    ## 🔸할당 연산자
    
    ![Untitled - 2022-10-06T174150 752](https://user-images.githubusercontent.com/67450169/194265493-909748e9-15f2-43a8-b6c4-088f9a30f709.png)
    
    ## 🔸sizeof와 삼항 연산자
    
   ![Untitled - 2022-10-06T174152 097](https://user-images.githubusercontent.com/67450169/194265503-7e04ba07-362f-44f1-8bcb-752a9efa7aa5.png)
    ---
    
   ![Untitled - 2022-10-06T174153 492](https://user-images.githubusercontent.com/67450169/194265523-39cc65e5-a9e9-4075-9481-cc57fbf0297f.png)
    
    ---
    
   ![Untitled - 2022-10-06T174155 545](https://user-images.githubusercontent.com/67450169/194265532-02a75080-a91c-4761-8f9e-7184e13558c9.png)
    
    ---
    
   ![Untitled - 2022-10-06T174158 118](https://user-images.githubusercontent.com/67450169/194265549-f1d86a04-bdea-4880-973e-317c7a75cbae.png)
    
    ---
    
    ```objectivec
    #import <Foundation/Foundation.h>
    
    int main ()
    {
        int a = 10;
        int i, j;
        
        while( a < 20 ) {
            NSLog(@"whlie : value of a: %d\n", a);
            a++;
        }
        
        for( a = 10; a < 20 ; a += 1) {
            NSLog(@"for : value of a: %d\n", a);
        }
        
        a = 10;
        do {
            NSLog(@"do-while : value of a: %d\n", a);
            a++;
        } while( a < 20 );
        
        for( i = 1; i < 10 ; i += 1) {
            for( j = 1; j < 10 ; j += 1) {    
                NSLog(@"%d x %d = %d", i, j, (i * j));
            }
        }
    
        return 0;
    }
    ```
    
    ---
    
    ## 🔸반복문의 제어문
    
    ![Untitled - 2022-10-06T174159 868](https://user-images.githubusercontent.com/67450169/194265576-417d01cc-1882-4344-a2c9-4a5ea396532f.png)
    ```objectivec
    #import <Foundation/Foundation.h>
    
    int main ()
    {
        int a = 10;
        
        while( a < 20) {
            NSLog(@"value of a: %d\n", a);
            a++;
            
            if (a > 15) {
                break;
            }
        }
    
        a = 10;
        
        do {
            if( a == 15 ) {
                a = a + 1;
                continue;
            }
            NSLog(@"value of a: %d\n", a);
            a++;
        }while( a < 20 );
    
        return 0;
    ```
    
    ---
    
    ## 🔸무한 반복
    
   ![Untitled - 2022-10-06T174201 741](https://user-images.githubusercontent.com/67450169/194265593-88b662e9-566a-42a7-a64c-f4560a43074b.png)
    
    ## 🔸조건문
    
   ![Untitled - 2022-10-06T174203 233](https://user-images.githubusercontent.com/67450169/194265602-1019fc6e-80af-466e-ac7c-489b24b938e2.png)
    
    **0 또는 null 이면 false 값**
    
    ---
    
    ```objectivec
    #import <Foundation/Foundation.h>
    
    int main ()
    {
       int a = 30;
       
       if ( a < 20 ) {
           NSLog(@"a는 20보다 작습니다.");
       } else if ( a < 40 ) {
           NSLog(@"a는 40보다 작고 20보다 크거나 같습니다.");
       } else {
           NSLog(@"a는 40보다 크거나 같습니다.");
       }
       
       
       NSLog(@"a는 %d입니다.", a);
       
       return 0;
    }
    ```
    
    ---
    
    ## 🔸?: 연산자
    
    - 우리는 이전 장에서 본 조건부 연산자 ? : 를  if…else 문을 대체하는데 사용할 수 있습니다.
    - ? : 연산자는 다음과 같은 일반적인 형태를 가지고 있습니다.
    
   ![Untitled - 2022-10-06T174205 074](https://user-images.githubusercontent.com/67450169/194265614-cdd610e2-6f80-4c8e-839f-802da6db19c6.png)
