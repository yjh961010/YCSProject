<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계좌 추가</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        input[type="submit"],
        button {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"],
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        button:hover {
            background-color: #45a049;
        }

        .small-button {
            width: 30%;
            margin: 5px;
            display: inline-block;
        }
    </style>
</head>
<body>

<h1>계좌 추가</h1>

<form class="container">
    <label for="id">아이디 :</label>
    <input type="text" id="id" name="id" placeholder="id를 입력하세요" required>

    <label for="number">번호:</label>
    <input type="text" id="number" name="number" placeholder="번호를 입력하세요" required>

    <label for="mail">이메일:</label>
    <input type="text" id="mail" name="mail" placeholder="메일 입력하세요" required>

    <label for="checkNumber">인증번호:</label>
    <input type="text" id="checkNumber" name="checkNumber" placeholder="인증번호를 입력하세요" required>
    
    <!-- 인증번호 관련 버튼들 --> 
    <div>
        <button type="button" class="small-button" onclick="sendCheckNumber()">보내기</button>
        <button type="button" class="small-button" onclick="confirmCheckNumber()">확인</button>
        <button type="button" class="small-button" onclick="resendCheckNumber()">다시 보내기</button>
    </div>
</form>

<script>
    function sendCheckNumber() {
    	var email = document.getElementById('mail').value;
    	var id = document.getElementById('id').value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/acount/mail.do", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    alert('인증번호가 ' + email + '로 전송되었습니다.');
                }
            };
            xhr.send("email=" + encodeURIComponent(email)  + "&id=" + encodeURIComponent(id));       
        
    }
 
    function confirmCheckNumber() {
        var checkNumber = document.getElementById("checkNumber").value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/acount/confirmCheckNumber", true); // 서버의 /confirmCheckNumber 엔드포인트로 요청
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert(xhr.responseText); // 서버의 응답을 알림으로 표시
            }
        };
        xhr.send("checkNumber=" + encodeURIComponent(checkNumber)); // 인증번호를 서버로 전송
    }

    function resendCheckNumber() {
        // 인증번호 재발송 로직을 여기에 추가
        alert("인증번호가 다시 발송되었습니다.");
        sendCheckNumber();
        
    }
    
</script>

</body>
</html>
