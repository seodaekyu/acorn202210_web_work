<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test.jsp</title>
</head>
<body>
	<div id="one"></div>
	<script>
		
		let data = {imagePath:"/images/kim1.png"};
		
		let img1 = '<img src="/Step04_Final/images/kim1.png">';
		
		let img2 = '<img src="/Step04_Final' +data.imagePath+ '">';
		
		let img3 = `<img src="/Step04_Final\${data.imagePath}">`;
		//${}는 자바스크립트에서 즉시 해석이 되는 표현식이다. 그래서 경로를 끌고오는것이 아니라 참조를 하려고 하기때문에
		// \(역 슬래시)를 통해 이건 참조를 하려는게 아니라 웹 브라우저를 통해 경로를 끌고 오려고 하는거야 라고 알려줌
		//표현언어(EL)에서 ${} 과 #{} 표기법의 차이 https://dololak.tistory.com/744 링크 참고하기
		
	</script>
</body>
</html>