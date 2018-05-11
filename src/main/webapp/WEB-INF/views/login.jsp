<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- Bootstrap 4 CSS  -->
		<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/bootstrap.min.css"  rel="stylesheet" type="text/css" />
				
	<c:url value="/resources/js" var="jsPath"/>
	    <script src="${jsPath}/bootstrap.min.js" ></script> 
			
		
<title>SIG- CASA DO OLEIRO</title>
</head>
<body>
<div class="container">
<div class="row">
    <div class="col-sm">
     
    </div>
    <div class="col-sm" style="padding-top:5%">
    <img src="resources/imagens/logo.png" style="padding:10px 10px; width:100%;"/><br><br>
      <form:form servletRelativeAction="/login" method="post" >
		
		  <div class="form-group">
		    <label for="exampleInputEmail1">Login</label>
		    <input name="username" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Entre com seu Usuário">
		    
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Senha</label>
		    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Senha...">
		  </div>
		  <button type="submit" class="btn btn-primary">Logar</button>
		
		</form:form>
    </div>
    <div class="col-sm">
     
    </div>
  </div>

</div>
			
<c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath}/bootstrap.min.js" crossorigin="anonymous" ></script> 
    <script src="${jsPath}/bootstrap.bundle.min.js" crossorigin="anonymous" ></script> 		
</body>
</html>