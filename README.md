# Blockchainsawman_Blocklist
Blocklist : 온체인 기반 스테이블 코인 거래 AML 서비스

## 🧑‍💻 개발 환경 및 기술 스택

[Xcode] [SwiftUI] [Alamofire] [URLScheme]


## 🚧 설계

### 시스템 아키텍처
 MVVM + Clean Architecture
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
