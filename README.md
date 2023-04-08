<p align="center"><img width="250" alt="앱 로고" src="https://user-images.githubusercontent.com/61315014/200597632-8df84b23-b048-4850-9d99-8b2e851dd1c7.png"></p>

<p align="center"><img width="300" alt="앱 스토어" src="https://user-images.githubusercontent.com/61315014/200598183-b42118d4-4683-44b3-a7af-471c58391a61.png"></p>

<p align="center"><img width="700" alt="메인 스샷" src="https://user-images.githubusercontent.com/61315014/200598533-ecee25dd-7357-44e2-91bd-23b752ca6f41.png"></p>

## Topic

- **[푸이 - 내 손안의 모든 음식점]** (2022.11 -> 2000 다운로드)
- **음식 성격 "푸이티아이" 기반 음식점 경험 기록 및 추천 서비스**
- **맡은 역할** : iOS 개발 담당 (SW 마에스트로 13기 푸이 팀 - 서버 1명, iOS 1명, 안드로이드 1명)
- **개발 기간** : 2022.04 ~ 2022.12. 현재 지속적으로 서비스 운영 중
- 2022.08 (v1.0.0) 첫 배포 후 지속적으로 리팩토링, 기능 추가하며 업데이트 (2022.10 v1.2.0)
- **푸이 사이트** : https://fooiy.com/
- **앱스토어 링크** : https://apps.apple.com/kr/app/푸이-내-손안의-모든-음식점/id1640024571
- **머니투데이 기사** : https://news.mt.co.kr/mtview.php?no=2022091716551984413
- **창업을 하는 팀 규정 상 코드가 private 처리 되어있는 점 양해 부탁드립니다.**

## Archiecture

![](https://velog.velcdn.com/images/heyksw/post/8761e1b5-83fa-4c15-9bd8-c6e29b41a461/image.png)

**모듈 분석**
- **App (Fooiy)** : Dependency Injection, AppCoordinator, TabBarCoordinator, Kakao/Firebase Configuration
- **Feature** : 탭 페이지 별 피쳐 모듈 분리. 지도 / 피드 / 문의 / 내 정보 페이지. 피쳐 모듈끼리는 코디네이터 패턴을 활용해 의존성 없이 화면 이동
- **Common** : Feature에서 공통적으로 활용하는 코드 구성. Enum, String, Extension 등
- **CommonUI** : Feature에서 공통적으로 활용하는 UI 모음. FooiyButton, FooiyTableCell, FooiyCollectionCell, BaseViewController, Resource 등
- **Domain** : 비즈니스 로직. Feature에서 필요한 UseCase, Repository Protocol, VO
- **Data** : 데이터 획득. Feature Repositories, Network 로직 (Moya), 로컬 데이터 로직 (UserDefaults)
- **Entity** : DTO (Data Transfer Object)

## Tech

- **언어** : Swift
- **아키텍처** : MVVM + Clean Architecture + Modularization
- **모듈화** : Tuist
- **비동기 처리** : RxSwift, RxCocoa
- **이미지 처리** : Kingfisher
- **네트워크 처리** : Moya, RxMoya
- **서비스 로케이터 / DI** : Swinject
- **Server Driven UI** (백엔드 정보를 기반으로 한 유동적 UI 구성)
→ Server Driven UI 를 공부하며 블로그에 정리한 글 : [https://velog.io/@heyksw/Server-Driven-UI-Multi-Cell-Type-Custom-Table-View](https://velog.io/@heyksw/Server-Driven-UI-Multi-Cell-Type-Custom-Table-View)
- **코디네이터 패턴 활용** : 모듈간 의존성 없이 화면 전환 구현
- **디자인 시스템, 커스텀 뷰 재활용**
- **협업** : Jira, GitFlow, Figma

## Experience

- **Tuist** : Swift 로 모듈 의존성 설정 및 Swift Package Manager 관리. 빌드 세팅 관리
- **MVVM 패턴** : 뷰 로직과 비즈니스 로직을 분리함으로써 유지보수성 + 테스트 용이성 향상. RxSwift, RxCocoa, RxDataSource 를 활용해서 옵저버 패턴 - 데이터 바인딩 구현.
- **RxCocoa / RxDataSource** : Reactive Programming - 데이터 흐름에 반응한 프로그래밍. UITableView, UICollectionView Delegate 메서드를 함수형 프로그래밍을 사용해 가독성있게 코드 작성
- **모듈화** : 비슷한 책임을 갖는 코드, 클래스들을 모아 모듈이라는 단위로 분리. 코드의 결합도와 의존성을 낮추고, 어떤 로직이 어떤 모듈에 존재할 지 쉽게 파악 가능하게 해서 개발 효율 향상.
- **Clean Architecture 레이어 기반 모듈화** : 이를 통해 수정이나 확장 스펙이 들어왔을 때 어떤 모듈을 수정하면 되는지 쉽게 파악할 수 있고, 모듈끼리 의존성을 최소화 했기 때문에 필요한 모듈만 수정함으로써 유지보수 성능 향상.

- **Server Driven UI** : 오직 백엔드 데이터를 기반으로 변화하는 유동적인 UI 개발.
  - [푸이] 는 출시한지 얼마되지 않은 앱이기 때문에 앱의 기획 요소가 자주 변동되고, 그에 따라 코드를 수정할 일이 빈번합니다.
  - 유저가 앱 업데이트를 하지 않아도 오직 백엔드 데이터에 의해 UI 를 변경 시킬 수 있는 구조를 만들어서 이를 해소할 수 있었습니다.
  - 예를 들어, 나중에 텍스트 뷰가 추가 될 수 있는 가능성이 있는 화면이라면 백엔드 Json 데이터에 텍스트 뷰 isHidden = true / false 정보를 내려주어, 유동적으로 텍스트 뷰를 추가 할 수 있도록 했습니다.
- **CommonMoyaProvider** : 모든 API 코드에 중복 로그인 에러를 공통적으로 묶어 처리.
  - 푸이의 **모든 api response 에는 중복 로그인 에러 코드가 포함**될 수 있습니다. 모든 api response 에 중복 로그인 에러처리를 하는 반복적인 코드를 작성하지 않기 위해, Moya 라이브러리의 **MoyaProvider 를 커스텀** 했습니다. 푸이의 Moya TargetType 은 FeedAPI, MapAPI, AccountAPI .. 등 매우 많습니다. 이에 따른 MoyaProvider<FeedAPI>, MoyaProvider<MapAPI> 등을 사용하고 있었는데, 제네릭을 활용해 CommonMoyaProvider<T: TargetType> 를 만들어서 모든 TargetType 을 수용할 수 있게 만들었고, 그 CommonMoyaProvider 의 NetworkLoggerPlugin responseData 에 중복 로그인 에러 로직을 작성하여, CommonMoyaProvider 를 사용하는 모든 API 코드에 중복 로그인 에러가 자동으로 처리되도록 구현했습니다. 
  - **그래서 푸이의 모든 Moya API 코드는 오직 CommonMoyaProvider 한 개만을 사용**하고 있습니다. 이 구조는 나중에 생길 수 있는 api 코드 변화에도 유용할 것으로 생각됩니다.
- **협업, 회의** : 디자이너와의 대화를 통해 "...를 완료했습니다." 를 사용하는 페이지는 모두 동일한 디자인을 사용하도록 요청했습니다. 예를 들어, 닉네임 변경을 완료하거나, 게시물 등록을 완료했을때, 문의 등록을 완료했을 때 등의 "..를 완료했습니다." 페이지는 **동일한 Custom ViewController 를 활용**했습니다.
- 피드 테이블 뷰 UI에서, 수많은 게시물들을 효율적으로 로드하기 위해 스크롤마다 일정량의 게시물을 로드하는 로직 구현 경험. (무한 스크롤)
- 지도, 피드, 푸시 알림, Server Driven UI, RxSwift, RxMoya, 커스텀 collectionview, 커스텀 tableview 등 다양한 개발 경험.

## ScreenShot  

<p align="center"><img width="700" alt="스샷0" src="https://user-images.githubusercontent.com/61315014/200599133-3e6d6215-ab07-432c-8cd4-92bd69b0e926.png"></p>

<p align="center"><img width="700" alt="스샷1" src="https://user-images.githubusercontent.com/61315014/200599151-ced87d1e-ffe4-4185-ac64-9e03827b6452.png"></p>

<p align="center"><img width="700" alt="스샷2" src="https://user-images.githubusercontent.com/61315014/200599166-dd3ecd0f-bdc0-457f-8dbc-b7de49920de3.png"></p>

<p align="center"><img width="700" alt="스샷3" src="https://user-images.githubusercontent.com/61315014/200599186-67a9a8f8-b4ef-47aa-8535-51db15d38c11.png"></p>

<p align="center"><img width="700" alt="스샷4" src="https://user-images.githubusercontent.com/61315014/200599193-edd2f9e0-9fee-4c29-987f-db1c94af3ccf.png"></p>

<p align="center"><img width="700" alt="스샷5" src="https://user-images.githubusercontent.com/61315014/200599198-f81d414e-e1d3-46b6-a73b-f08d9c868aa0.png"></p>

<p align="center"><img width="700" alt="스샷6" src="https://user-images.githubusercontent.com/61315014/200599201-c0e20507-d295-4f89-b150-8745f87d814a.png"></p>
