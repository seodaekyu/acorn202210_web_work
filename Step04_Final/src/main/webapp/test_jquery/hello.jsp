<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/hello.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h3>jquery 테스트</h3>
	<p id="one"></p>
	<p id="two"></p>
	<div>div1</div>
	<div class="my-class">div2</div>
	<div>div3</div>
	<div class="my-class">div4</div>
	<div>div5</div>
	<input class="my-class" type="text" id="inputMsg" />
	<button id="sendBtn">전송</button>
	<script>
		/*
			$("선택자").action1().action2().... 와 같은 형태로 jQuery 를 사용한다.
			
			$( ) 함수는 jQuery 의 기능이 추가된 배열을 리턴한다.
			
			$( ) 함수가 리턴하는 배열에는 "선택자" 에 부합하는 문서객체(body, p, div, input 등) 의 참조 값이 들어있다.
			
			$( ).action1() 처럼 특정 동작을 하면 $( ) 함수가 리턴한 배열 안에 들어 있는 모든 문서객체에 동작이 적용된다.
			
			$( ).action1().action2()... 처럼 chain 형태의 동작은 가능할때도 있고 아닐때도 있다.
			만일 어떤 동작이 무언가를 읽어오는 동작이면 뒤에 chain 형태의 동작은 불가능하다.
		*/
	
		//id 가 one 인 요소의 innerText 를 "김구라", 글자의 색을 blue 로 조작하기
		$("#one").text("김구라").css("color", "blue");
		
		//id 가 two 인 요소의 innerText 를 나의 이름, 글자의 크기를 20px, 배경색을 yellow 로 조작해보세요.
		$("#two").text("서대규").css("font-size", "20px").css("background-color", "yellow");
		
		//모든 div 요소의 글자 색을 pink 로 바꾸기
		$("div").css("color", "pink");
		
		/*
			이벤트 리스너 함수를 등록하는 방법
			
			$("선택자").on("이벤트명", 콜백 함수);
		*/
		
		$("#sendBtn").on("click", function(){
			//아이디가 inputMsg 인 곳에 입력한 값을 읽어와서 상수 msg 에 담는다.
			const msg = $("#inputMsg").val();
			alert(msg+" 를 전송합니다.");
		});
	</script>
</body>
</html>