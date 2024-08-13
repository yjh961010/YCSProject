<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계산기</title>
    <style>
        form {
            margin: 20px;
        }
        .calculator {
            display: grid;
            grid-template-columns: repeat(4, 50px);
            gap: 5px;
        }
        .calculator button {
            width: 50px;
            height: 50px;
            font-size: 18px;
        }
        #display {
            width: 215px;
            height: 50px;
            font-size: 18px;
            text-align: right;
            margin-bottom: 5px;
        }
        #result {
            margin-top: 10px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <h1>계산기</h1>
    <form action="/admin/calculator.do" method="POST">
        <input type="text" id="display" name="display" value="${display}" readonly>
        <input type="hidden" name="operation" id="operation" value="${operation}">
        <input type="hidden" name="result" id="resultValue" value="${result}">
        <div class="calculator">
            <button type="button" onclick="appendNumber('7')">7</button>
            <button type="button" onclick="appendNumber('8')">8</button>
            <button type="button" onclick="appendNumber('9')">9</button>
            <button type="button" onclick="setOperation('/')">/</button>
            <button type="button" onclick="appendNumber('4')">4</button>
            <button type="button" onclick="appendNumber('5')">5</button>
            <button type="button" onclick="appendNumber('6')">6</button>
            <button type="button" onclick="setOperation('*')">*</button>
            <button type="button" onclick="appendNumber('1')">1</button>
            <button type="button" onclick="appendNumber('2')">2</button>
            <button type="button" onclick="appendNumber('3')">3</button>
            <button type="button" onclick="setOperation('-')">-</button>
            <button type="button" onclick="appendNumber('0')">0</button>
            <button type="button" onclick="appendNumber('.')">.</button>
            <button type="submit">계산</button>
            <button type="button" onclick="clearDisplay()">C</button>
            <button type="button" onclick="setOperation('+')">+</button>
        </div>
    </form>

    <div id="result">
        <c:if test="${not empty result}">
            결과: ${result}
        </c:if>
    </div>

    <script>
        function appendNumber(number) {
            const display = document.getElementById('display');
            display.value += number;
        }

        function setOperation(operation) {
            const display = document.getElementById('display');
            const existingValue = display.value;
            if (existingValue && !['+', '-', '*', '/'].includes(existingValue.slice(-1))) {
                display.value += ' ' + operation + ' ';
            }
        }

        function clearDisplay() {
            document.getElementById('display').value = '';
        }
    </script>
</body>
</html>