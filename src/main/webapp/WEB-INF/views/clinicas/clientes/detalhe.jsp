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
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
	<script type="text/javascript">
	        function mascar(cpf){ 
	            if(cpf.value.length == 3)
	                cpf.value = cpf.value + '.'; //quando começamos a digitar, o script irá inserir um parênteses no começo do campo.
	            if(cpf.value.length == 7)
	                cpf.value = cpf.value + '.'; //quando o campo já tiver 3 caracteres (um parênteses e 2 números) o script irá inserir mais um parênteses, fechando assim o código de área.
	 
	            if(cpf.value.length == 11)
	                cpf.value = cpf.value + '-'; //quando o campo já tiver 8 caracteres, o script irá inserir um tracinho, para melhor visualização do telefone.
                
	  
	}
	    </script>
	
<title>${clientes.nome} - Detalhe</title>
</head>
<body class="container-fluid">
<nav class="navbar navbar-expand-sm  navbar-dark fixed-top" style="background-color: #24244E;" >
  <a class="navbar-brand" href="/controlemembros/" style="width: 15%;"><img src="http://127.0.0.1:8080/controlemembros/resources/imagens/casadooleiro.png" width="100%"></a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link text-light" href="../../carrinho/atendimento">Atendimento</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../../clinicas/cadastro">Cadastro Clinicas</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../../clientes/form">Cadastro Clientes</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../../relatorio/relatorios">Relatórios</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../../logout">Sair</a>
    </li>
  </ul>
</nav>
<div class="container-fluid" style="margin-top:80px;">
		<h2>Titular: ${clientes.nome}</h2>
		
  		<h4>Telefone: ${clientes.telefone}</h4>
  		<p>${clientes.empresa}
			  <table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>Nome</th>
			        <th>Data Nascimento</th>
			        <th>Telefone</th>
			        <th>Telefone 2</th>
			        <th>CPF</th>
			        <th>Cidade</th>
			        <th>Bairro</th>
			        <th>Endereço</th>
			        <th>CEP</th>
			      </tr>
			    </thead>
			    <tbody>
			      
			      <c:forEach items="${clientes.dependente }" var="dependente" varStatus="status">
					<tr>
					<td>${dependente.nome}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${dependente.dataNascimento.time}"/></td>
					<td id="telefone">${dependente.telefone }</td>
					<td id="telefone">${dependente.telefone2 }</td>
					<td id="cpf">${dependente.cpf}</td>
					<td>${dependente.cidade}</td>
					<td>${dependente.bairro}</td>
					<td>${dependente.endereco}</td>
					<td>${dependente.cep}</td>
					</tr>
			      </c:forEach>        
			            
			    </tbody>
			  </table>
			  
</div>

  


</body>

</html>