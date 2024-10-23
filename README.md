# 요기요 웹사이트 벤치마킹 프로젝트

## 개요
본 프로젝트는 **Spring Framework**, **MyBatis**, **Oracle Database**를 기반으로 요기요 웹사이트를 벤치마킹하여 개발되었습니다. 관리자는 점주 및 일반 고객을 위한 페이지 접근을 분리하여 각각의 기능을 구현하였습니다.

회원가입은 일반 고객과 점주로 구분되며, **카카오톡**을 통한 본인 인증이 필수입니다. 회원가입 후에는 본인 정보 수정 및 회원탈퇴가 가능합니다. 점주는 관리자의 승인을 통해 점주 등급으로 변경됩니다.

일반 고객은 카테고리 검색이나 직접 검색을 통해 가게 페이지에 접근할 수 있으며, 장바구니 담기 및 쿠폰 사용으로 즉시 결제를 진행할 수 있습니다. 또한, 가게별로 리뷰 작성을 할 수 있습니다.

점주 사용자는 가게 추가 및 수정 기능을 통해 메뉴의 추가/수정/삭제 및 품절 처리, 주문 내역 조회, 매출 데이터 시각화, 쿠폰 추가 및 가게 일시중지 기능을 사용할 수 있습니다.

관리자는 공지글 작성, 수정 및 삭제가 가능하며, 로그인 시 최신 공지를 팝업으로 표시합니다. 점주 회원가입 목록에서 승인 처리가 가능합니다.

## 기획 의도 (동기)
요기요 웹사이트는 일반 고객과 점주 사용자에게 편리한 배달 이용 서비스를 제공하는 것을 목표로 합니다. 점주와 고객 모두 직관적이고 간편한 기능으로 판매 및 구매를 할 수 있으며, 점주는 가게 페이지에서 자율적인 관리가 가능합니다. 고객은 별점, 리뷰 수, 사장님 댓글 수를 통해 가게의 경쟁력을 판단하고, 쿠폰 서비스를 통해 소비적인 이점을 누릴 수 있습니다. 또한 리뷰 기능을 통해 상호 이익을 도모할 수 있는 시너지 효과를 기대합니다.

## 목표 및 설계

### 팀적 목표
각 기능은 관리자, 점주, 사용자 별로 나누어 기획하였으나, 서로 연관된 내용이 많아 매주 전체 회의를 최소 1회 진행하여 모든 팀원이 진행 상황을 공유합니다. 주요 기능 추가나 DB 구조 변경은 전체 회의를 통해 영향을 분석하고 진행합니다. 점주-사용자 사이의 기능 연결이 많아 매일 개발 상황과 향후 일정도 공유합니다.

## 개발 환경
- **운영 체제**: Windows 10
- **개발 IDE**: IntelliJ, Eclipse
- **빌드 도구**: Maven
- **로컬 서버**: Apache Tomcat 9.0
- **데이터베이스**: Oracle
- **데이터베이스 관리 도구**: DBeaver

## 사용 기술
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Java_logo_and_wordmark.svg/1920px-Java_logo_and_wordmark.svg.png" alt="Java" width="50"/> 
<img src="https://upload.wikimedia.org/wikipedia/commons/d/db/JavaScript_logo_2.svg" alt="JavaScript" width="50"/> 
<img src="https://spring.io/images/spring-logo.svg" alt="Spring" width="50"/> 
<img src="https://mybatis.org/images/mybatis-logo.png" alt="MyBatis" width="50"/> 
<img src="https://www.spring.io/images/spring-scheduler.png" alt="Spring Scheduler" width="50"/> 
<img src="https://jquery.com/jquery-wp-content/themes/jquery.com/images/jquery-logo.svg" alt="jQuery" width="50"/> 
<img src="https://www.chartjs.org/img/chartjs-logo.svg" alt="Chart.js" width="50"/> 
<img src="https://upload.wikimedia.org/wikipedia/commons/9/99/AJAX_logo_and_wordmark.svg" alt="AJAX" width="50"/> 
<img src="https://developers.kakao.com/assets/img/kakaodevelopers.png" alt="Kakao Developers" width="50"/> 
<img src="https://upload.wikimedia.org/wikipedia/commons/d/de/JSON_logo_200x200.png" alt="JSON" width="50"/> 
