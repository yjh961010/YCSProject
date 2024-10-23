# YCS 프로젝트

## 개요
YCS 프로젝트는 사용자들의 적금을 도와주는 웹사이트입니다. 적금 방식은 크게 두 가지로 나뉘며, **기본 적금 방식**과 **골든볼 적금 방식**이 있습니다. 

적금 사용자들은 해당 단위 기간 상품에 가입하게 되면, **일별**, **주별**, **월별** (1개월 상품은 불가)로 적금을 선택할 수 있으며, **토스페이**로 결제하여 본인 계좌에 충전하는 방식으로 진행합니다. 

적금 중도 해지 시 약간의 패널티 요금이 부과되며, 기본 적금과 골든볼 적금의 차이점은 만기 시 골든볼 적금이 기본 적금보다 이자율이 낮지만, 패널티 요금을 상금으로 대체하여 추첨을 통해 지급받을 수 있습니다. 

관리자는 적금 상품을 추가/수정할 수 있으며, 회원 조회 및 검색이 가능합니다. 또한 상품별로 적금 금액 및 가입 인원을 차트로 가시화하여 볼 수 있습니다. 사용자들끼리 사용할 수 있는 커뮤니티 기능도 있으며, 관리자는 이 커뮤니티의 게시물 관리도 가능합니다. 이러한 기능들을 통해 YCS 웹사이트는 사용자들에게 흥미롭고 재밌는 방식으로 적금을 장려합니다.

## 목표 및 설계

### 팀적 목표
팀은 크게 사용자와 관리자 역할로 나누어 개발을 진행하였습니다. 백엔드에서는 기능을 도메인별로 나누어 협업을 진행했습니다. 각 역할은 다음과 같습니다:
- 관리자
- 사용자(결제)
- 사용자(프론트엔드)
- 사용자(커뮤니티)

GitHub를 이용하여 협업하였고, 매주 2회의 대면 회의를 통해 진행 상황을 공유하였습니다.

## 사용 도구
- **개발 IDE**: IntelliJ, Eclipse
- **빌드 도구**: Maven
- **로컬 서버**: Apache Tomcat 9.0
- **데이터베이스**: Oracle
- **데이터베이스 관리 도구**: DBeaver

## 사용 기술
- Java
- JavaScript
- Spring MVC
- Spring Security
- MyBatis
- Spring Scheduler
- Chart.js
- AJAX
- Toss Developer API
- Spring Data JPA
