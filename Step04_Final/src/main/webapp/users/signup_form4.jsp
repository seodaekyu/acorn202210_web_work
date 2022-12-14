<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
   <div className="container">
      <h3>회원 가입 폼 입니다.</h3>
      <form action="signup.jsp" method="post" id="signupForm">
         <div>
            <label className="control-label" htmlFor="id">아이디</label>
            <input className="form-control" type="text" name="id" id="id"/>
            <small className="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
            <div className="valid-feedback">사용 가능한 아이디 입니다.</div>
            <div className="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         
         <div>
            <label className="control-label" htmlFor="pwd">비밀번호</label>
            <input className="form-control" type="password" name="pwd" id="pwd"/>
            <small className="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
            <div className="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div>
            <label className="control-label" htmlFor="pwd2">비밀번호 확인</label>
            <input className="form-control" type="password" name="pwd2" id="pwd2"/>
         </div>
         
         <div>
            <label className="control-label" htmlFor="email">이메일</label>
            <input className="form-control" type="text" name="email" id="email"/>
            <div className="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button className="btn btn-outline-primary" type="submit">가입</button>
      </form>
   </div>
   <script>
   //유효성 여부를 저장 할 변수를 만들고 초기 값 대입
   let isIdValid = false;
   let isPwdValid = false;
   let isEmailValid = false;
   
      document.querySelector("#email").addEventListener("input", function(){
         
         this.classNameList.remove("is-valid");
         this.classNameList.remove("is-invalid");
         //입력한 이메일
         const inputEmail = this.value;
         //이메일을 검증할 정규 표현식 (const reg = /@/; 기존 방법)
         const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         //만일 입력한 이메일이 정규표현식 검증을 통과 하지 못했다면
         if(!reg.test(inputEmail)){
            this.classNameList.add("is-invalid");
            isEmailValid = false;
         }else{//통과 했다면 
            this.classNameList.add("is-valid");
         	isEmailValid = true;
         }
      });   
      
      function checkPwd(){
         //먼저 2개의 클래스를 제거하고 
         document.querySelector("#pwd").classNameList.remove("is-valid");
         document.querySelector("#pwd").classNameList.remove("is-invalid");
         //입력한 2개의 비밀 번호를 읽어와서 
         const pwd=document.querySelector("#pwd").value;
         const pwd2=document.querySelector("#pwd2").value;
         
   		 //비밀번호를 검증할 정규표현식
         const reg = /[\W]+/;
   		 //만일 정규표현식 검증을 통과하지 못했다면
         if(!reg.test(pwd)){
        	 document.querySelector("#pwd").classNameList.add("is-invalid");
        	 isPwdValid = false;
        	 return; //함수를 여기서 끝낸다.
         }
   		 
         //만일 비밀번호 입력란과 확인란이 다르다면
       	 if(pwd != pwd2){
            document.querySelector("#pwd").classNameList.add("is-invalid");
            isPwdValid = false;
         }else{//같다면
            document.querySelector("#pwd").classNameList.add("is-valid");
         	isPwdValid = true;
         }
      }
   
      document.querySelector("#pwd").addEventListener("input", function(){
         checkPwd();
      });
      
      document.querySelector("#pwd2").addEventListener("input", function(){
         checkPwd();
      });
   
   
      // id 를 입력 할때 마다 호출되는 함수 등록 
      document.querySelector("#id").addEventListener("input", function(){
         //input 요소의 참조 값을 self 에 미리 담아 놓기 
         const self = this;
         //일단 2개의 클래스를 모두 제거 한다음 
         self.classNameList.remove("is-valid");
         self.classNameList.remove("is-invalid");
         
         //1. 입력한 아이디를 읽어와서
         const inputId = self.value;
         
   		 //아이디 검증할 정규표현식
         const reg = /^[a-z].{4,9}$/;
         //입력한 아이디가 정규표현식과 매칭이 되는지 (통과 되는지) 확인한다.
         const isMatch = reg.test(inputId)
         //만일 매칭되지 않는다면
         if(!isMatch){
        	 self.classNameList.add("is-invalid");
        	 isIdValid = false;
        	 return; //함수를 여기서 끝내기
         }
         
         //2. 서버에 페이지 전환없이 전송을 하고 응답을 받는다.
         fetch("checkid.jsp?inputId="+inputId)
         .then(function(response){
            return response.json();
         })
         .then(function(data){
         	//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
            console.log(data);
            if(data.isExist){
               self.classNameList.add("is-invalid");
               isIdValid = false;
            }else{
               self.classNameList.add("is-valid");
               isIdValid = true;
            }
         });
      });
      
      //폼에 submit 이벤트가 일어났을 때 실행 할 함수 등록
      document.querySelector("#signupForm").addEventListener("submit", function(){
    	 
    	  //아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행되도록 해야한다.
    	  //폼 전체의 유효성 여부
    	  const isFormValid = isIdValid && isPwdValid && isEmailValid;
    	  //만일 폼이 유효하지 않다면
    	  if(!isFormValid){
    	  	event.preventDefault(); //폼 전송 막기
    	  }
      });
      
   </script>

   <%-- /include/footer.jsp 페이지를 포함 시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>