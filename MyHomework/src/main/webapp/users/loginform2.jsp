<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와본다.
	String url = request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url==null){
		//로그인 후 인덱스 페이지로 돌아갈 수 있도록 한다.
		String cPath = request.getContextPath();
		url = cPath+"/index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<style>
	body {
    background-color: #888;
    background-image: linear-gradient(45deg, #444 25%, transparent 25%, transparent 75%, #444 75%, #444), linear-gradient(45deg, #444 25%, transparent 25%, transparent 75%, #444 75%, #444);
    background-position: 0 0, 25px 25px;
    background-size: 50px 50px;
}

.wrapper {
    text-align: center;
    margin:auto;
    margin-top:225px;
    width: 420px;
    height: 450px;
    border:solid 3px;
    border-radius: 10%;
    background: pink;
}
h1 {
    margin-top: 65px;
    font-size: 50px;
}


input {
    text-align: left;
    width:225px;
    height:30px;
    border: none;
    border-bottom: solid 3px black;
    background: pink;
}

input::placeholder {
    color: black;
    font-size: 10px;
}


.email {
    padding-top: 19px;
}

img {
    width: 20px;
    height: 20px;
}

.password {
    padding-bottom: 32px;
    padding-top: 22px;
}

button {
    width: 225px;
    height: 50px;
    border-radius: 10%;
    font-size: 18px;
    font-weight: bold;
    border-radius: 10%;
    background: white;
    
}
</style>
    <head>
        <title>Log in</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="wrapper">
            <h1>Log In</h1>
            <div class="email">
                <img src="img/user.png">
                <input text="email" id="email" placeholder="Email"><br>
            </div>
            <div class="password">
                <img src="img/pass.png">
                <input text="password" id="password" placeholder="Password"><br><br>
            </div>
            <div class="div_button">
                <button class="button" type="button">Log In</button>
            </div>
        </div>
    </body>
</html>