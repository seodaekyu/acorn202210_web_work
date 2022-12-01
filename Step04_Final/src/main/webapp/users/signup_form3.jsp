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
   <div class="container">
      <h3>회원 가입 폼 입니다.</h3>
      <form v-on:submit="onSubmit" action="signup.jsp" method="post" id="signupForm">
      	 <p>폼의 유효성 여부 : <strong>{{isFormValid}}</strong></p>
         <div class="mb-2">
            <label class="control-label" for="id">아이디</label>
            <input 
            	v-on:input="onIdInput" 
            	v-model="id" 
            	v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}"
            	class="form-control" type="text" name="id" id="id"/>
            <div class="valid-feedback">사용 가능한 아이디 입니다.</div>
            <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         
         <div class="mb-2">
            <label class="control-label" for="pwd">비밀번호</label>
            <input
            	v-on:input="onPwdInput"
            	v-model="pwd"
            	v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}"
             class="form-control" type="password" name="pwd" id="pwd"/>
            <div class="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div>
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input 
            	v-on:input="onPwdInput"
            	v-model="pwd2"
            	class="form-control" type="password" name="pwd2" id="pwd2"/>
         </div>
         
         <div class="mb-2">
            <label class="control-label" for="email">이메일</label>
            <input 
            	v-on:input="onEmailInput"
            	v-model="email"
            	v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}"
            	class="form-control" type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button v-bind:disabled="!isFormValid" class="btn btn-outline-primary" type="submit">가입</button>
      </form>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
   <script>
   
   		new Vue({
   			el:"#signupForm",
   			data:{
   				isIdValid:false,
   				isPwdValid:false,
   				isEmailValid:false,
   				id:"",
   				pwd:"",
   				pwd2:"",
   				email:"",
   				isIdDirty:false, //id 가 한번이라도 입력됐을 때 에러메시지를 띄우게 한다.
   				isPwdDirty:false, //pwd 이 한번이라도 입력됐을 때 에러메시지를 띄우게 한다.
   				isEmailDirty:false, //email 이 한번이라도 입력됐을 때 에러메시지를 띄우게 한다.
   				
   			},
   			computed:{
   				isFormValid(){
   					//모델을 활용해서 얻어낼 값이 있으면 얻어낸다.
   					let result = this.isIdValid && this.isPwdValid && this.isEmailValid;
   					//함수에서 리턴해주는 값을 모델처럼 사용하면 된다.
   					return result;
   				}
   			},
   			methods:{
   				onSubmit(e){
   					//폼 전체의 유효성 여부
   					const isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
   					//만일 폼이 유효하지 않으면
   					if(!this.isFormValid){
 	  					e.preventDefault(); //폼 전송 막기	
   					}
   				},
   	   	 		onPwdInput:function(){
	   	   	 		 this.isPwdDirty = true;
	   	 			 //비밀번호를 검증할 정규표현식
	   	   	         const reg = /[\W]+/;
	   	   	   		 //만일 정규표현식 검증을 통과하지 못했다면
	   	   	         if(!reg.test(this.pwd)){
	   	   	        	 this.isPwdValid = false;
	   	   	        	 return; //함수를 여기서 끝낸다.
	   	   	         }
	   	   	   		 
	   	   	         //만일 비밀번호 입력란과 확인란이 다르다면
	   	   	       	 if(this.pwd != this.pwd2){
	   	   	            this.isPwdValid = false;
	   	   	         }else{//같다면
	   	   	         	this.isPwdValid = true;
	   	   	         }
   	   	 		},
   				
   				onEmailInput:function(){
   	   	 			this.isEmailDirty = true;
	   	   	 		//이메일을 검증 할 정규표현식
	   	   	  		const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   	   	  		
	   	   			//만일 입력한 이메일이 정규표현식 검증을 통과 하지 못했다면
	      	        if(!reg.test(this.email)){
	      	        	this.isEmailValid = false;
	      	        }else{//통과 했다면
	      	         	this.isEmailValid = true;
	      	        }
   	   	 		},
   				
   	   	 		onIdInput:function(){
   					 //아이디를 한번이라도 입력하면 아이디가 더럽혀졌는지 여부를 true로 바꿔준다.
   					 this.isIdDirty = true;
   					
   					 //아이디 검증할 정규표현식
	   	   	         const reg = /^[a-z].{4,9}$/;
	   	   	         //입력한 아이디가 정규표현식과 매칭이 되는지 (통과 되는지) 확인한다.
	   	   	         const isMatch = reg.test(this.id);
	   	   	         //만일 매칭되지 않는다면
	   	   	         if(!isMatch){
	   	   	        	 this.isIdValid = false;
	   	   	        	 return; //함수를 여기서 끝내기
	   	         	}
	   	   	         
	   	   	        //Vue 객체의 참조 값을 self 에 담기
	   	   	        const self = this;
	   	   	         
	   	   	 		//2. 서버에 페이지 전환없이 전송을 하고 응답을 받는다.
	   	   	        fetch("checkid.jsp?inputId="+this.id)
	   	   	        .then(function(response){
	   	   	            return response.json();
	   	   	        })
	   	   	        .then(function(data){
	   	   	         	//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
	   	   	            console.log(data);
	   	   	            if(data.isExist){
	   	   	               self.isIdValid = false;
	   	   	            }else{
	   	   	               self.isIdValid = true;
	   	   	            }
	   	   	        });
	   	   	 		
				}
			}
		});
   
   		/*
   		//유효성 여부를 저장 할 변수를 만들고 초기 값 대입
   	    let isIdValid = false;
   	    let isPwdValid = false;
   	    let isEmailValid = false;
   	   
   	      document.querySelector("#email").addEventListener("input", function(){
   	         
   	         this.classList.remove("is-valid");
   	         this.classList.remove("is-invalid");
   	         //입력한 이메일
   	         const inputEmail = this.value;
   	         //이메일을 검증할 정규 표현식 (const reg = /@/; 기존 방법)
   	         const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   	         //만일 입력한 이메일이 정규표현식 검증을 통과 하지 못했다면
   	         if(!reg.test(inputEmail)){
   	            this.classList.add("is-invalid");
   	            isEmailValid = false;
   	         }else{//통과 했다면 
   	            this.classList.add("is-valid");
   	         	isEmailValid = true;
   	         }
   	      });   
   	      
   	      function checkPwd(){
   	         //먼저 2개의 클래스를 제거하고 
   	         document.querySelector("#pwd").classList.remove("is-valid");
   	         document.querySelector("#pwd").classList.remove("is-invalid");
   	         //입력한 2개의 비밀 번호를 읽어와서 
   	         const pwd=document.querySelector("#pwd").value;
   	         const pwd2=document.querySelector("#pwd2").value;
   	         
   	   		 //비밀번호를 검증할 정규표현식
   	         const reg = /[\W]+/;
   	   		 //만일 정규표현식 검증을 통과하지 못했다면
   	         if(!reg.test(pwd)){
   	        	 document.querySelector("#pwd").classList.add("is-invalid");
   	        	 isPwdValid = false;
   	        	 return; //함수를 여기서 끝낸다.
   	         }
   	   		 
   	         //만일 비밀번호 입력란과 확인란이 다르다면
   	       	 if(pwd != pwd2){
   	            document.querySelector("#pwd").classList.add("is-invalid");
   	            isPwdValid = false;
   	         }else{//같다면
   	            document.querySelector("#pwd").classList.add("is-valid");
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
   	         self.classList.remove("is-valid");
   	         self.classList.remove("is-invalid");
   	         
   	         //1. 입력한 아이디를 읽어와서
   	         const inputId = self.value;
   	         
   	   		 //아이디 검증할 정규표현식
   	         const reg = /^[a-z].{4,9}$/;
   	         //입력한 아이디가 정규표현식과 매칭이 되는지 (통과 되는지) 확인한다.
   	         const isMatch = reg.test(inputId)
   	         //만일 매칭되지 않는다면
   	         if(!isMatch){
   	        	 self.classList.add("is-invalid");
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
   	               self.classList.add("is-invalid");
   	               isIdValid = false;
   	            }else{
   	               self.classList.add("is-valid");
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
      */
   </script>
</body>
</html>