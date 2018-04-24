<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Clínicas</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Casa do Oleiro</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="#">Atendimento</a></li>
	      <li><a href="#">Relátorios</a></li>
	      <li><a target="_self" href="#" >Cadastro Clinicas</a></li>
	      <li><a target="_self" href="/controlemembros/clinicas/cadastro">Cadastro Serviço Médico</a></li>
	    </ul>
	  </div>
	</nav>
<form:form action="/controlemembros/clinicas/servicos" method="post" >
<br><br><br>
	<div class="container">
		<label>Clínica:</label>
		<input type="text" name="nome"><br>
		<button type="submit">Cadastrar</button>
	</div>	
</form:form>

</body>
</html>