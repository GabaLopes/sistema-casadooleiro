<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 4 CSS  -->
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/bootstrap.min.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/stilo.css"  rel="stylesheet" type="text/css" />	
	<c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath}/bootstrap.min.js" ></script>
    <c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath }/jquery-3.3.1.slim.min.js"></script>
    <c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/popper.min.js"></script>
	<c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/jquery.min.js"></script>
	<link href="${cssPath}/w3.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/js" var="jsPath"/>
	<c:url value="/resources/imagens" var="imgPath"/>
	
	<script type="text/javascript">
            function calcular(){
                var valor1 = document.getElementById("valor1").value; //pega o valor do imput do valor 1
                var valor2 = document.getElementById("valor2").value; //pega o valor do imput do valor 2
                var subtracao = parseFloat(valor1 - valor2).toFixed(2); //calcula =D

                //insere no html da div subtraçao o imput com o valor da calculo
                document.getElementById("subtracao").innerHTML = "<span class='info-box-number'>"+ subtracao +""+'R$' +" </span>";
            }
</script> 
					
<title>Fechamento de Caixa</title>
</head>
<body>
<nav class="navbar navbar-expand-sm  navbar-dark fixed-top" style="background-color: #24244E;" >
  <a class="navbar-brand" href="/controlemembros/" style="width: 15%;"><img src="${imgPath}/casadooleiro.png" width="100%"></a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link text-light" href="carrinho/atendimento">Atendimento</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="clinicas/cadastro">Cadastro Clinicas</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="clientes/form">Cadastro Clientes</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="relatorio/relatorios">Relatórios</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="logout">Sair</a>
    </li>
  </ul>
</nav>
<div style="margin-top:80px" class="container">

<div class="border border-dark" style="padding: 5px 5px 5px 5px;">
<h2 class="text-primary"><b>VENDAS DO DIA</b></h2>
<h4><b>Dinheiro: </b><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${vendadinheiro}" type="currency"/> </h4>
<input type="hidden" value="${vendadinheiro}" id="valor2" >
<h4><b>Cartão: </b><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${vendacartao}" type="currency"/> </h4>
</div>
<br>
<div class="border border-dark" style="padding: 5px 5px 5px 5px;">
<h2 class=""><b>VALOR INFORMADO CAIXA:</b></h2>
<br>
<h4><b>Dinheiro: </b><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${caixadinheiro}" type="currency"/>
<input type="hidden" value="${caixadinheiro}" id="valor1" >
 </h4>


<h4><b>Cartão: </b><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${caixacartao}" type="currency"/>  </h4>

</div>
<div id="subtracao"></div>

</div>

<div id="id01" class="w3-modal " style="display: block">
		    <div class="w3-modal-content w3-animate-zoom">
		      <header class="w3-container w3-teal"> 
		        <span onclick="document.getElementById('id01').style.display='none'" 
		        class="w3-button w3-display-topright">&times;</span>
		        <h2>Fechamento Diário</h2>
		      </header>
	        <div class="w3-container">
	        <br>
			<h1 class="text-success">${sucesso }</h1>
			<h1 class="text-danger">${falha }</h1>
			</div><br><br>
			</div>
	        </div>


</body>

</html>