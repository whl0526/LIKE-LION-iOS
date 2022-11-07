- 11-07(월-**prototyping 1day -drivecourseReccommend**)
    
![Untitled (14)](https://user-images.githubusercontent.com/67450169/200323370-e6ab9795-8ea8-45d7-8bb8-e671fcf62f14.png)    
![Untitled (13)](https://user-images.githubusercontent.com/67450169/200323374-48d9037f-432c-4f33-a4f4-df0e1295f7b7.png)    
![Untitled (25)](https://user-images.githubusercontent.com/67450169/200323755-da0bca0c-9783-46eb-8660-dd3aa3019767.png)
![Untitled (15)](https://user-images.githubusercontent.com/67450169/200323393-79895efd-5c1d-45f2-9be0-64e69e697ed5.png)
![Untitled (16)](https://user-images.githubusercontent.com/67450169/200323397-f6d2322e-ec5a-4649-854d-033efc3c2bfc.png)    
![Untitled (17)](https://user-images.githubusercontent.com/67450169/200323405-84e03c1d-ca83-47de-b86b-aad1494904b9.png)    
![Untitled (18)](https://user-images.githubusercontent.com/67450169/200323411-1ebb3fd3-99fe-410f-bfdf-44585567201b.png)    
![Untitled (19)](https://user-images.githubusercontent.com/67450169/200323415-5e12e7ce-ae82-471a-9ae1-e06f248a69d3.png)    
![Untitled (20)](https://user-images.githubusercontent.com/67450169/200323420-fad2bd5d-148b-4276-8aca-822224acb32c.png)    
![Untitled (21)](https://user-images.githubusercontent.com/67450169/200323432-19803679-a474-4869-862d-ee3cfd51cf4e.png)    
![Untitled (22)](https://user-images.githubusercontent.com/67450169/200323440-6f72a827-9d57-4036-88de-fceec6a7ae6f.png)    
    ---
    
![Untitled (23)](https://user-images.githubusercontent.com/67450169/200323482-e185944a-7402-4505-bb71-441527f82e09.png)    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/15f8648e-d9a2-498a-8ba8-fac37fc58210/Untitled.png)
    
    # **메디컬부킹**
    
    ### **회고 10조-이원형**
    
    ## **앱 정의 문장(ADS)**
    
    - 이 앱은 고객이 처방전 사진을 찍어 업로드 하면 원하는 시간에 방문하여 여유롭게 조제된 약과 특수약을 받을 수 있으며
    - 약사는 사람들이 붐비는 시간을 효율적 분배하여 일의 능률도가 상승할 수 있습니다.
    - 사람들이 붐비는 시간 약국은 조제하느라 시간이 많이 소요되고 순번을 알아차리기 힘듭니다.
    - 그래서 고객들이 처방전 사진을 찍고 방문 일자와 시간을 업로드하면 리스트별로 저장되어 약사가 업로드된 처방전 기반으로 조제합니다.
    - 조제가 완료되면 약사가 조제완료 알림과 복용지도 설명을 보내줍니다.
    
    ---
    
    - 고객에게 기본적으로 반경내의 약국을 검색해주고 따로 검색시 외부 지역의 약국도 검색가능하게 해주고
    - 처방된 약에 따라 복용 알림을 띄워줍니다.
    - 모르는데 하고싶은 기능- 처방전 사진 AR로 따와서 처방된 약 별로 약의 사진과 복용 방법을 따로 알려주고 싶습니다.
    
    ---
    
    채택 될 줄 몰랐기 때문에 구체적으로 선정하진 않았습니다만, 구현이 복잡하고 어렵기 때문에 시간적 할애를 많이 하실 수 있으신 분이면 충분하다고 생각합니다.
    
    ## **이 앱을 주로 사용할 사용자는(페르소나)는 누구입니까?**
    
    - 병원 방문후 처방전을 가지고 있는 환자
    - 약국을 운영하는 약사
    
    ## **사용자(페르소나)의 특성은 무엇이라 생각합니까?**
    
    - 병원을 자주 방문하여 처방전을 계속 처방받는 환자
    - 특수 약을 처방받아 약을 예약하여 구매하는 환자
    - 사람들이 붐비는 시간대에 약국을 방문하여 기다림이 긴 환자
    - 환자가 붐벼 처방전이 쌓여 순서가 헷갈리는 약사
    - 고객의 정보를 저장하여 crm 시스템을 갖추려는 약사
    
    ## **생각하는 주요 기능**
    
    - 로그인
    - 약사 회원가입
    - 처방전 업로드시 처방전 속 QR코드 읽어 확대하기
    - 처방전 업로드시 처방약의 글을 AR로 띄워 약의 사진과 복약설명 띄우기
    - 현재 위치 기준 주변 3km 이내 약국 리스트 및 약국 정보 띄우기
    - 약 복용 알림기능
    - 업로드된 처방전 별로 현재 조제 순서 파악
    
    ## **이 앱은 우리 앱스쿨 기간에 완성 가능성을 어느정도로 보시나요? 완성 가능성이 떨어져도 프로토타입 제작용만으로도 가치는 충분합니다.**
    
    - 완성 가능성 70%
    
    ## **이 앱의 가치는 어디에 있을까요? 다음의 예시를 참고해 더 자세히 적어주세요**
    
    - 약국을 자주 이용하는 환자의 시간 효율성을 높일 수 있다.
    - 1.주변 3km이내 약국을 검색한 후 약국을 선택하여 처방전 사진을 찍어 올리면 담당 약사가 업로드된 처방전의 확대된 QR를 리더기에 찍어 조제를 시작한다.
    - 2.고객은 방문 일정을 입력하여 정해진 시간에 약을 받으며 약사는 여유롭게 조제할 수 있다.
    - 3.환자는 조제 순번을 UI로 실시간으로 띄워 직관적으로 확인할 수 있다.
    - 4.특수 약이 필요한 사람은 번거로움없이 당일 약을 수령할 수 있다.
    - 5.약 복용 시간별 알림기능으로 규칙적인 복용 라이프가 된다.
    - 약사 입장에서 고객관리로 단골을 유치할 수 있다.
