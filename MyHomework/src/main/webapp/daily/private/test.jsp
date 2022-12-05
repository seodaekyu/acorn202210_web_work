<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/test.jsp</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>
   
   <%-- /include/navbar.jsp 포함시키기 --%>
   <jsp:include page="/include/navbar.jsp">
      <jsp:param value="index" name="thisPage"/>
   </jsp:include>
   
   <div class="container row justify-content: space-between;" style="margin-left: 300px;">
      <div class="card mt-3 mb-3 ml-100 col-3" style="width: 18rem; ">
        <img src="data:image/png;base64,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" class="card-img-top mt-3" height="200px" alt="...">
        <div class="card-body">
          <h5 class="card-title">백준 알고리즘</h5>
          <p class="card-text">개발공부에 도움되는 백준예제를 풀어보세요.</p>
          <a href="https://www.acmicpc.net/" class="btn btn-primary">Go!</a>
        </div>
      </div>
      &nbsp;
      &nbsp;
      <div class="card mt-3 mb-3 col-3 " style="width: 18rem; ">  
        <img src="https://1.bp.blogspot.com/-GJWxOqkQFxM/X87jX3qjCuI/AAAAAAAA954/mc7VB8_GpXoAuizMfd92v4GxRvLJQmfVACLcBGAsYHQ/s2048/ilya-pavlov-OqtafYT5kTw-unsplash.jpg" class="card-img-top mt-3" height="200px" alt="...">
        <div class="card-body">
          <h5 class="card-title">코딩 테스트</h5>
          <p class="card-text">취업공부에 도움되는 코딩테스트를 풀어보세요.</p>
          <a href="http://jungol.co.kr/" class="btn btn-primary">Go!</a>
        </div>
      </div> 
   </div>
   
   <%-- /include/footer.jsp 페이지를 포함 시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
   <jsp:include page="/include/footer.jsp"></jsp:include>
   
</body>
</html>