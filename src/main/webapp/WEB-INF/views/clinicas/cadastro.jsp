<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
	<link href="${cssPath}/w3.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/js" var="jsPath"/>
  
  <script type="text/javascript">
	  $(document).ready(function(){
		  $("#myInput").on("keyup", function() {
			    var value = $(this).val().toLowerCase();
			    $("#myTable tr").filter(function() {
			      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			    });
			  });
			});
	</script>
  
<title>Cadastro de Clínicas</title>
</head>

<body class="container-fluid">

<nav class="navbar navbar-expand-sm  navbar-dark fixed-top" style="background-color: #24244E;" >
  <a class="navbar-brand" href="/controlemembros/" style="width: 15%;"><img src="../resources/imagens/casadooleiro.png" width="100%"></a>
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

<div class="row" style="margin-top:80px">
<div class="col-sm-12" >
<div class="col-md-5 float-left">	
		<div class="card">
		<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Cadastrar Clínica</h6></div>
		<div class="card-body">
	<form:form servletRelativeAction="/controlemembros/clinicas/adicionar" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Clínica</span>
	  		</div>
	  		<input type="text"  class="form-control" name="nome">
			<button type="submit" class="btn btn-success">Cadastrar</button>
		</div>
		<br>
				<h5 class="text-success">${sucessos }</h5>
				<h5 class="text-danger">${excluido}</h5>
				<h5 class="text-success">${atualizado}</h5>
				<h5 class="text-success">${clinicasucesso}</h5>
				<h5 class="text-success">${clinicaremovida}</h5>
	</form:form>
		
		<button class="btn btn-info" onclick="document.getElementById('id01').style.display='block'">Editar Clinica</button>
			<div id="id01" class="w3-modal ">
		    <div class="w3-modal-content w3-animate-zoom">
		      <header class="w3-container w3-teal"> 
		        <span onclick="document.getElementById('id01').style.display='none'" 
		        class="w3-button w3-display-topright">&times;</span>
		        <h2>Alterar Clinica</h2>
		      </header>
	        <div class="w3-container">
			<form:form servletRelativeAction="/controlemembros/clinicas/atualizarClinica" method="POST">
		    <div class="form-group">
			<label for="exampleFormControlSelect1">Clínica:</label>
				<select name="clinica" class="form-control" id="exampleFormControlSelect1">
					<c:forEach items="${clinica}" varStatus="status">
						<option value="${clinica[status.index].id}">${clinica[status.index].nome}</option>
					</c:forEach>
				</select>
			</div>
			<div class="w3-container">
		    <div class="form-group">
		    <label>Nome da Clinica</label>    
		    <input type="text" name="clinicaNova">    
		    </div>
		    </div>
		    <input type="submit" value="Alterar" class="btn btn-success">  
			</form:form><br>
			
			<header class="w3-container w3-teal"> 
		       
		        <h2>Remover Clinica</h2>
		      </header>
			
			<form:form servletRelativeAction="/controlemembros/clinicas/removerClinica" method="POST">
			<div class="form-group">
			<label for="exampleFormControlSelect1">Clínica:</label>
				<select name="clinica" class="form-control" id="exampleFormControlSelect1">
					<c:forEach items="${clinica}" varStatus="status">
						<option value="${clinica[status.index].id}">${clinica[status.index].nome}</option>
					</c:forEach>
				</select>
			
			</div>
			<button class="btn btn-danger">Remover</button>
			</form:form>
			</div><br><br>
			</div>
	        </div>
		    </div>
		
		</div>
		</div>
	

<div class="col-md-7 float-right">
	<div class="card">
	<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Cadastrar Serviço Médico</h6></div>
	<div class="card-body">
	<form:form class="form-group"
		servletRelativeAction="/controlemembros/clinicas" method="post">
			<div class="form-group" >
			<label for="exampleFormControlSelect1">Clínica:</label>
				<select name="clinica" class="form-control" id="exampleFormControlSelect1">
					<c:forEach items="${clinica}" varStatus="status">
						<option value="${clinica[status.index].nome}">${clinica[status.index].nome}</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Serviço Médico</span>
	  			</div>
				<input type="text" class="form-control"  required="required" name="tipo">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Médico</span>
	  			</div>
				<input type="text" class="form-control"  required="required" name="medico">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">CH</span>
	  			</div>
				<input type="text" class="form-control" value="0" name="ch">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">AMB</span>
	  			</div>
				<input type="text" class="form-control" value="0"  name="amb">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Valor</span>
	  			</div>
				<input type="text" class="form-control" required="required" name="valor">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Valor de Custo</span>
	  			</div>
				<input type="text" class="form-control"  required="required" name="valorClinicas">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Valor Particular</span>
	  			</div>
				<input type="text" class="form-control"  required="required" name="valorPart">
			</div>
			<button type="submit" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Cadastrar</button>
	</form:form>
	</div>
	</div>
	</div>
	 <p class="text-sucess"> ${sucesso }</p>
		      

</div>
</div>		
<div class="container-fluid">
		<div class="card">
	<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Procurar Serviço Médico</h6></div>
	<div class="card-body">
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="basic-addon1">Procurar</span>
	  </div>
	  <input type="text" class="form-control"  id="myInput" placeholder="Buscar Serviço..." aria-label="Username" aria-describedby="basic-addon1">
	</div>	
	<br>
	<div style="overflow: auto; height:400px;">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Id</th>
				<th>Serviço</th>
				<th>Médico</th>
				<th>Clínica</th>
				<th>AMB</th>
				<th>CH</th>
				<th>Valor</th>
				<th>Custo</th>
				<th>Particular</th>
			</tr>
		</thead>
		<tbody id="myTable">

			<c:forEach items="${servico}" var="servicos">
				<tr>
					<td>${servicos.id}</td>
					<td>${servicos.tipo}</td>
					<td>${servicos.medico }</td>
					<td>${servicos.clinica}</td>
					<td>${servicos.amb}</td>
					<td width="3%">${servicos.ch}</td>
					<td width="8%"><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorOleiro}" type="currency"/></td>
					<td width="8%"><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorClinica}" type="currency"/></td>
					<td width="8%"><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorParticular}" type="currency"/></td>
					<td width="3%"><form:form
							servletRelativeAction="/controlemembros/clinicas/excluir">
							<input type="hidden" value="${servicos.id}" name="id">
							<button type="submit" class="btn btn-danger"><img id="image-1" alt="" width="15px" src="../resources/imagens/lixo.png"/></button>
						</form:form></td>
					<td width="3%"><form:form
							servletRelativeAction="/controlemembros/clinicas/atualizar" method="GET">
							<input type="hidden" value="${servicos.id}" name="id">
							<button type="submit" class="btn btn-warning"><img id="image-1" alt="" width="15px" src="../resources/imagens/atualizar.png"/></button>
						</form:form></td>	
				</tr>
			</c:forEach>

		</tbody>
	</table>
	</div>
</div>	
</div>
</div>
</body>
</html>