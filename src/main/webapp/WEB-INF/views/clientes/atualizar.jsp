<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>     
<!DOCTYPE html">
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
	<c:url value="/resources/imagens" var="imgPath"/>
	<script type="text/javascript">
	        function mascara(telefone){ 
	            if(telefone.value.length == 0)
	                telefone.value = '(' + telefone.value; //quando começamos a digitar, o script irá inserir um parênteses no começo do campo.
	            if(telefone.value.length == 3)
	                telefone.value = telefone.value + ') '; //quando o campo já tiver 3 caracteres (um parênteses e 2 números) o script irá inserir mais um parênteses, fechando assim o código de área.
	 
	            if(telefone.value.length == 10)
	                telefone.value = telefone.value + '-'; //quando o campo já tiver 8 caracteres, o script irá inserir um tracinho, para melhor visualização do telefone.
	  
	}
	    </script>
	    
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
	    
	    <script type="text/javascript">
	        function masc(data){ 
	            if(data.value.length == 2)
	                data.value = data.value + '/'; //quando começamos a digitar, o script irá inserir um parênteses no começo do campo.
	            if(data.value.length == 5)
	                data.value = data.value + '/'; //quando o campo já tiver 3 caracteres (um parênteses e 2 números) o script irá inserir mais um parênteses, fechando assim o código de área.
	 
	           
	}
	    </script>
	
<title>Atualizar - ${cliente.nome}</title>
</head>
<body>
<nav class="navbar navbar-expand-sm  navbar-dark fixed-top" style="background-color: #24244E;" >
  <a class="navbar-brand" href="/controlemembros/" style="width: 15%;"><img src="${imgPath}/casadooleiro.png" width="100%"></a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link text-light" href="../carrinho/atendimento">Atendimento</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../clinicas/cadastro">Cadastro Clinicas</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../clientes/form">Cadastro Clientes</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../relatorio/relatorios">Relatórios</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../logout">Sair</a>
    </li>
  </ul>
</nav>

<div class="container" style="margin-top: 80px;">
	<form:form class="form-group" servletRelativeAction="/controlemembros/clientes/atualizar" method="post">
		<div class="card">
		<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Atualizar Cliente</h6></div>
		<div class="card-body">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><strong>Titular:</strong></span>
	  		</div>
	  		<input type="hidden" value="${cliente.id }" name="id">
	  		<input type="hidden" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${cliente.dataCadastro.time}'/>" name="data">
	  		<input type="text" class="form-control" value="${cliente.nome}" name="nome">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Telefone:</b></span>
	  		</div>
	  		<input type="text" class="form-control" onkeypress="mascara(this)" maxlength="15" value="${cliente.telefone}" name="telefone">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>CPF:</b></span>
	  		</div>
	  		<input type="text" class="form-control" onkeypress="mascar(this)" maxlength="14" value="${cliente.cpf}" name="cpf">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Cidade:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${cliente.cidade}" name="cidade">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Bairro:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${cliente.bairro}" name="bairro">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Endereço:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${cliente.endereco}" name="endereco">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>CEP:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${cliente.cep}" name="cep">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Empresa Conveniada:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${cliente.empresa}" name="empresa">
  		</div>
  		<c:forEach items="${cliente.dependente}" var="dependente" varStatus="status">
	  	<div class="input-group mb-3">	
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Dependente:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${dependente.nome }" name="dependente[${status.index }].nome">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Data de Nascimento:</b></span>
	  		</div>
	  		<input type="text" onkeypress="masc(this)" maxlength="10"  class="form-control" name="dependente[${status.index}].dataNascimento" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${dependente.dataNascimento.time}'/>" >
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Telefone:</b></span>
	  		</div>
	  		<input type="text" class="form-control" onkeypress="mascara(this)"  maxlength="15"	 value="${dependente.telefone}" name="dependente[${status.index }].telefone">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>CPF:</b></span>
	  		</div>
	  		<input type="text" onkeypress="mascar(this)" maxlength="14"  class="form-control" name="dependente[${status.index}].cpf" >
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Cidade:</b></span>
	  		</div>
	  		<input type="text"  class="form-control" name="dependente[${status.index}].cidade" >
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Bairro:</b></span>
	  		</div>
	  		<input type="text"  class="form-control" name="dependente[${status.index}].bairro" >
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Endereço:</b></span>
	  		</div>
	  		<input type="text" class="form-control" name="dependente[${status.index}].endereco" >
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>CEP:</b></span>
	  		</div>
	  		<input type="text" class="form-control" name="dependente[${status.index}].cep" >
  		</div>
  		</c:forEach>
  		
  		<button type="submit" class="btn btn-success">Atualizar</button>
  		</div>
  		</div>
	</form:form>
</div>
</body>
</html>