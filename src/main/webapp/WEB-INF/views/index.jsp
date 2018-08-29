<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

   <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap 4 CSS  -->
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/bootstrap.min.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/w3.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/stilo.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath}/bootstrap.min.js" ></script>
   
    
    
<title>SIG - CASA DO OLEIRO</title>
</head>
<body style="background-color:#FFFFFF;">
<div class="container-fluid " >
<div class="row" >
  <div class="col-sm-3" style="background-color: #24244E;padding-bottom:20%;" >
  <img src="resources/imagens/casadooleiro.png" style="padding-top:5%;padding-left:5%;padding-right:5%; width:100%;" ><br><br>
  <p class="text-white" style="padding-left: 30px"><b>Usuário: <security:authentication property="principal.username"/></b></p>
  <ul class="listamenu">
  	<li class="menu"><a href="carrinho/atendimento" class="menu2"><img src="resources/imagens/atendimento.png" width="10%" >  Atendimento</a></li>
  	<li class="menu"><a href="clientes/form" class="menu2"><img src="resources/imagens/cadastro.png" width="10%">  Cadastro de Clientes</a></li>
  	<li class="menu"><a href="clinicas/cadastro" class="menu2"><img src="resources/imagens/clinica.png" width="9%">  Cadastro de Clínicas</a></li>
  	<li class="menu"><a href="relatorio/relatorios" class="menu2"><img src="resources/imagens/relator.png" width="9%">  Relátorios</a></li>
  	<li class="menu"><a href="logout" class="menu2"><img src="resources/imagens/logout.png" width="9%">  Sair</a></li>
  </ul>
 
  </div>
  <div class="col-sm-9">
  	<div class="row" style="padding-top:5%;">
    <div class="col-sm ">
      <a href="carrinho/atendimento" class="nolink">
      <div class="shadow p-3 mb-5 lopes" align="center" style="width:80%;height:auto; padding-top:20px;padding-bottom:10px; ">
      <img src="resources/imagens/venda.png" width="50%"><br>
      <h4 >Atendimento</h4>
      </div>
      </a><br>
       <a href="relatorio/relatorios" class="nolink">
      <div class="shadow p-3 mb-5 lopes" align="center" style="width:80%;height:auto; padding-top:20px;padding-bottom:10px; ">
      <img src="resources/imagens/relatorio.png" width="50%"><br>
      <h4 >Relatorios</h4>
      </div>
      </a>
    </div>
    <div class="col-sm">
      <a href="clientes/form" class="nolink">
      <div class="shadow p-3 mb-5 lopes" align="center" style="width:80%;height:auto; padding-top:20px;padding-bottom:10px; ">
      <img src="resources/imagens/cadastrocliente.png" width="50%"><br>
      <h4 >Cadastrar Cliente</h4>
      </div>
      </a><br>
      
                  
    </div>
    <div class="col-sm">
       <a href="clinicas/cadastro" class="nolink">
      <div class="shadow p-3 mb-5 lopes" align="center" style="width:80%;height:auto; padding-top:20px;padding-bottom:10px; ">
      <img src="resources/imagens/cadastroclinica.png" width="50%"><br>
      <h4 >Cadastrar Clinica</h4>
      </div>
      </a>
    </div>
  	</div>
  
  </div>  	
  	
  </div>
  
</div>


<nav class="navbar fixed-bottom navbar-light bg-light">

</nav>

</body>
</html>