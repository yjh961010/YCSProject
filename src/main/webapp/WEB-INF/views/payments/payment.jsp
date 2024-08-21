<%--
  Created by IntelliJ IDEA.
  User: ihyeonmin
  Date: 24. 8. 12.
  Time: 오전 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
    <link rel="stylesheet" type="text/css" href="/style.css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>토스페이먼츠 샘플 프로젝트</title>
    <!-- SDK 추가 -->
    <script src="https://js.tosspayments.com/v2/standard"></script>
</head>

<body>
<!-- 주문서 영역 -->
<div class="wrapper">
    <div class="box_section" style="padding: 40px 30px 50px 30px; margin-top: 30px; margin-bottom: 50px">
        <h1>일반 결제</h1>
        <!-- 결제 UI -->
        <label for="amount">충전 금액</label>
        <input type="text" id="amount" oninput="updateAmount(this.value)" placeholder="최소 충전 금액: 1,000원">
        <div id="payment-method" style="display: flex">
            <button id="CARD" class="button2" onclick="selectPaymentMethod('CARD')">카드</button>

            <button id="TRANSFER" class="button2" onclick="selectPaymentMethod('TRANSFER')">계좌이체</button>
        </div>
        <!-- 결제하기 버튼 -->
        <button class="button" style="margin-top: 30px" onclick="requestPayment()">결제하기</button>
    </div>

</div>
<script>
    const amount = {
        currency: "KRW",
        value: ''
    };

    function updateAmount(value) {
        // 쉼표 제거 및 정수로 변환
        const numericValue = parseInt(value.replace(/,/g, ''), 10);

        // 유효한 숫자인지 확인
        if (!isNaN(numericValue) && numericValue >= 1000) {
            amount.value = numericValue;
            document.getElementById('amount').classList.remove('error');
        } else {
            amount.value = 0;
            document.getElementById('amount').classList.add('error');
        }

        console.log('Current amount:', amount.value); // 디버깅용
    }
    let selectedPaymentMethod = null;

    function selectPaymentMethod(method) {
        if (selectedPaymentMethod != null) {
            document.getElementById(selectedPaymentMethod).style.backgroundColor = "#ffffff";
        }

        selectedPaymentMethod = method;
        console.log(selectedPaymentMethod);

        document.getElementById(selectedPaymentMethod).style.backgroundColor = "rgb(229 239 255)";
    }

    // ------  SDK 초기화 ------
    // TODO: clientKey는 개발자센터의 API 개별 연동 키 > 결제창 연동에 사용하려할 MID > 클라이언트 키로 바꾸세요.
    // TODO: server.js 의 secretKey 또한 결제위젯 연동 키가 아닌 API 개별 연동 키의 시크릿 키로 변경해야 합니다.
    // TODO: 구매자의 고유 아이디를 불러와서 customerKey로 설정하세요. 이메일・전화번호와 같이 유추가 가능한 값은 안전하지 않습니다.
    // @docs https://docs.tosspayments.com/sdk/v2/js#토스페이먼츠-초기화
    const clientKey = "test_ck_6bJXmgo28e1pJj0EzE1A8LAnGKWx";
    const customerKey = generateRandomString();
    const tossPayments = TossPayments(clientKey);
    // 회원 결제
    // @docs https://docs.tosspayments.com/sdk/v2/js#tosspaymentspayment
    const payment = tossPayments.payment({
        customerKey,
    });
    // 비회원 결제
    // const payment = tossPayments.payment({customerKey: TossPayments.ANONYMOUS});

    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // @docs https://docs.tosspayments.com/sdk/v2/js#paymentrequestpayment
    async function requestPayment() {
        let type = document.getElementById("TRANSFER")
        function usePostData(url, body) {
            return fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(body)
            }).then(response => response.json());
        }

        // 결제 요청-->
        var body = {
            payType: selectedPaymentMethod,
            amount: Number(amount.value),
            orderName: '입금',
            yourSuccessUrl: `${window.location.origin}/payment-success`,
            yourFailUrl: `${window.location.origin}/fail`,
        };
        try {
            const res = await usePostData('/api/v1/payments/toss', body);

            // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
            // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.

            switch (selectedPaymentMethod) {
                case "CARD":
                    await payment.requestPayment({
                        method: "CARD", // 카드 및 간편결제
                        amount,
                        orderId: res.orderId,
                        orderName: "입금",
                        successUrl: window.location.origin + "/payment/success.html", // 결제 요청이 성공하면 리다이렉트되는 URL
                        failUrl: window.location.origin + "/payment/fail.html", // 결제 요청이 실패하면 리다이렉트되는 URL
                        customerEmail: res.customerEmail,
                        customerName: res.customerName,
                        customerMobilePhone: "01012341234",
                        card: {
                            useEscrow: false,
                            flowMode: "DEFAULT",
                            useCardPoint: false,
                            useAppCardOnly: false,
                        },
                    });
                    break
                case "TRANSFER":
                    await payment.requestPayment({
                        method: "TRANSFER", // 계좌이체 결제
                        amount,
                        orderId: res.orderId,
                        orderName: "입금",
                        successUrl: window.location.origin + "/payment/success.html",
                        failUrl: window.location.origin + "/payment/fail.html",
                        customerEmail: res.customerEmail,
                        customerName: res.customerName,
                        customerMobilePhone: "01012341234",
                        transfer: {
                            cashReceipt: {
                                type: "소득공제",
                            },
                            useEscrow: false,
                        },
                    });
                    break;
            }
        }catch (error) {
            console.error("Payment request failed:", error);
        }
    }



    function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
        console.log(generateRandomString());
    }
</script>
</body>
</html>