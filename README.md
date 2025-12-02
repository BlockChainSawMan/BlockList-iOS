Blocklist : 온체인 기반 스테이블 코인 거래 AML 서비스

## 🧑‍💻 개발 환경 및 기술 스택

<img src="https://img.shields.io/badge/Xcode-147EFB?style=flat-square&logo=xcode&logoColor=white"> <img src="https://img.shields.io/badge/SwiftUI-0CA6FF?style=flat-square&logo=swift&logoColor=white"> <img src="https://img.shields.io/badge/Alamofire-FF5722?style=flat-square&logo=swift&logoColor=white"> <img src="https://img.shields.io/badge/URL_Scheme-4A90E2?style=flat-square&logo=internet-explorer&logoColor=white">


## 🚧 설계

### 📉 시스템 아키텍처
 ![MVVM-Architecture png](https://github.com/user-attachments/assets/05a77d12-0f5c-4a97-b646-58721e0c8216)

### 📂 iOS Part Directory

```bash
.
BlockChainSawMan
├── Presentation                     # 화면(UI) 계층
│   ├── AnalysisView.swift           # 지갑 위험도 분석 화면
│   ├── BlockListApp.swift           # 앱 엔트리 포인트
│   ├── GraphWebView.swift           # D3.js 그래프 WebView
│   ├── LoginView.swift              # 로그인 화면
│   ├── LottieView.swift             # Lottie 애니메이션 뷰
│   ├── MainView.swift               # 메인 홈 화면
│   ├── ResultReasonView.swift       # 위험 분석 사유 상세 화면
│   ├── ResultView.swift             # 블록리스트 결과 화면
│   ├── SplashView.swift             # 스플래시 화면
│   ├── Trade                        # 거래 관련 뷰 디렉토리
│   │   └── TradeListView.swift      # 거래 리스트 화면
│
├── Graph                            # 그래프 관련 리소스 및 WebView 스크립트
│   ├── d3.v7.min.js                 # D3.js 그래프 라이브러리
│   ├── EvidenceGraph.swift          # SwiftUI용 그래프 뷰
│   ├── graph.html                   # 그래프 렌더링용 웹 페이지
│   └── graphScript.js               # 그래프 로직(JS)
│
├── Resource                         # 앱 리소스
│   ├── Font                         # 커스텀 폰트 디렉토리
│   │   ├── glegoo                   # Glegoo 폰트 파일
│   │   └── pretendard               # Pretendard 폰트 파일
│   ├── BlockListFontModifier.swift  # 글로벌 폰트 설정 Modifier
│   ├── FontExtension.swift          # Font 관련 SwiftUI 확장
│   ├── Assets.xcassets              # 이미지 에셋
│   ├── ColorExtension.swift         # Color 확장
│   ├── Info.plist                   # 앱 설정 파일
│   ├── LoadingAnimation.swift       # 로딩 애니메이션 뷰
│   └── Config                       # API 및 환경설정 관련 파일
├── Network
│   ├── API                                  # API 엔드포인트 정의 계층
│   │   ├── Graph                            # Graph 관련 API
│   │   │   ├── DTO                          # API 응답/요청 모델
│   │   │   │   └── PostCheckWalletResponseDTO.swift
│   │   │   └── GraphAPI.swift               # 지갑 분석 API 요청 담당
│   │
│   ├── Networking                           # 공통 네트워크 로직
│   │   ├── BaseResponse.swift               # 공통 API Response 모델
│   │   ├── APIHeaderType.swift              # API 헤더 타입 정의
│   │   ├── APIPaths.swift                   # 공통 API Path 목록
│   │   ├── APIEndpoint.swift                # 최종 URL 조합 로직
│   │   ├── CreateQueryString.swift          # 쿼리스트링 생성 유틸
│   │   ├── EmptyResponse.swift              # Body 없는 Response 모델
│   │   ├── ErrorDTO.swift                   # 에러 Response 모델
│   │   ├── NetworkConstants.swift           # 공통 네트워크 상수
│   │   ├── NetworkError.swift               # 네트워크 오류 타입
│   │   ├── NetworkLogger.swift              # 요청/응답 로그 출력
│   │   └── PageableDTO.swift                # 페이징 응답 모델
│
└──  README.md   
```

## 📂 AI Part

### 📱 iOS-Based AML Risk Visualization & Collaborative System Development

<img width="2816" height="1504" alt="Gemini_Generated_Image_84wl8a84wl8a84wl" src="https://github.com/user-attachments/assets/f1430f50-ba2d-47cb-9129-b35db56b8a84" />

본 프로젝트는 AI파트에서 구현한 분석 로직을 모바일 환경에서 직관적으로 확인하고, 팀원과 신속하게 공유할 수 있는 iOS 클라이언트 애플리케이션을 구축하는 과정입니다.

개발의 첫 단추인 앱 기본 구조 및 네트워크 구축 단계에서는 유지보수와 확장성을 고려하여 MVVM 패턴과 Clean Architecture를 기반으로 앱을 설계하였습니다. 공통 UI 컴포넌트와 디자인 시스템(컬러/폰트)을 정립하여 일관된 사용자 경험을 제공하도록 했으며, 통신 계층에는 Alamofire를 적용하여 서버 API와의 안정적인 데이터 송수신 환경을 마련하였습니다. 특히 서버로부터 전달받는 위험 점수와 그래프 데이터(JSON)를 효율적으로 처리하기 위해 정교한 Request/Response DTO 매핑과 에러 핸들링 로직을 구현하였습니다.

핵심 기능인 위험도 분석 및 그래프 시각화 단계에서는 사용자가 지갑 주소를 입력했을 때, 즉각적으로 위험 등급을 파악할 수 있는 시각화 인터페이스를 구현하였습니다. 특히, 네이티브 앱 환경에서 복잡한 네트워크 그래프를 표현하기 위해 WebView와 D3.js를 연동하는 하이브리드 방식을 채택하였습니다. 이를 통해 'Evidence Graph'를 렌더링하고, JavaScript와 Swift 간의 브리지(Bridge)를 연결하여 노드 터치 시 반응하는 인터랙티브한 경험을 제공했습니다. 또한, 두 개의 지갑을 동시에 비교 분석할 수 있는 기능을 추가하여 교차 검증의 편의성을 높였습니다.

마지막 외부 연동 및 협업 기능 구축 단계에서는 분석 결과의 활용도를 극대화하기 위해 Slack 및 DeepLink 기술을 도입하였습니다. 분석 화면에서 버튼 하나로 위험 점수와 요약 정보를 Slack 채널로 전송하는 Webhook 기능을 구현하였으며, 메시지 내에 **URL Scheme(DeepLink)**을 심어 팀원이 링크를 클릭하면 즉시 앱이 실행되어 해당 지갑의 상세 분석 화면으로 이동하도록 자동화된 워크플로우를 완성하였습니다.
