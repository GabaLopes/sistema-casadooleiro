<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE  html>
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
	<link href="${cssPath}/w3.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/js" var="jsPath"/>
  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
    <script src="http://malsup.github.com/jquery.form.js"></script> 
 
	<script type="text/javascript"> 
	
    // wait for the DOM to be loaded 
    $(document).ready(function() { 
        // bind 'myForm' and provide a simple callback function 
        $('#myForm').ajaxForm(function() { 
           
        }); 
    }); 
	</script> 
  
	
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
	<script type="text/javascript">
  $(document).ready(function(){
	  $("#myInput2").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable2 tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>
<title>Atendimento - Casa do Oleiro</title>

</head>
<body>

<nav class="navbar navbar-expand-sm  navbar-dark fixed-top" style="background-color: #24244E;" >
  <a class="navbar-brand" href="/controlemembros/" style="width: 15%;"><img src="http://192.168.0.113:8080/controlemembros/resources/imagens/casadooleiro.png" width="100%"></a>
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


<div class="container-fluid" style="margin-top: 80px;">
<div align="center"><h4 class="text-success"><strong>${vendasucesso} </strong></h4></div>

<div class="card" style="background-color: #F4F4F4">
		<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">ATENDIMENTO AO CLIENTE</h6></div>
		<div class="card-body">
<div><button type="button" class="btn btn-primary" onclick="window.location.href='../carrinho'">Ir Para o Carrinho</button><button class="btn btn-info" style="margin-left:10px " onclick="document.getElementById('id01').style.display='block'">Adicionar Cliente</button></div>
      <div id="id01" class="w3-modal ">
	    <div class="w3-modal-content w3-animate-zoom">
	      <header class="w3-container w3-teal"> 
	        <span onclick="document.getElementById('id01').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2>Adicionar Cliente</h2>
	      </header>
	      <div class="w3-container">
	        <div class="input-group" style="padding-left: 1%; padding-right:1%; padding-top:10px"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control" id="myInput2" type="text" placeholder="Procurar Cliente..."></div>
			<div style="height:400px; overflow: auto;padding-top:10px ">
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Titular</th>
						<th>Dependente</th>
					</tr>
				</thead>
				<tbody id="myTable2">
				<c:forEach items="${clientes}" var="cliente">
					<tr>
						<td><p>${cliente.nome}</p>
						<form:form servletRelativeAction="/controlemembros/carrinho/addCliente" method="post">
								<input type="hidden" name="titular" value="${cliente.nome}">
								<input type="hidden" name="telefone" value="${cliente.telefone}">
								<button type="submit" class="btn btn-success">Inserir</button>
						</form:form>
						</td>
						<td>
						<form:form servletRelativeAction="/controlemembros/carrinho/addCliente" method="post">
								<input type="hidden" name="titular" value="${cliente.nome}">
								<select class="form-control" name="dependente">
									<c:forEach items="${cliente.dependente}" var="depen">
										<option value="${depen.nome}">${depen.nome}</option>
										
									</c:forEach>
								</select>
								<input type="hidden" name="telefoneDependente" value="${depen.telefone}">
								<button type="submit" class="btn btn-primary">Inserir</button>
						</form:form>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			
			</div>
	      </div>
	    </div>
  	<br>
  	<p class="text-success"><b>${sucessos}</b></p><p class="text-success"><b>${sucesso}</b></p>
<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control" id="myInput" type="text" placeholder="Procurar Serviço..."></div>
	<div style="height:400px; overflow: auto; ">
	<table class="table table-bordered">
	    <thead>
	      <tr>
	      	<th>Id</th>
	        <th>Serviço</th>
	        <th>Médico</th>
	        <th>Clínica</th>
	        <th>Valor</th>
	        <th>Custo</th>
	        <th>Particular</th>
	        <th>Desconto</th>
	      </tr>
	    </thead>
	    <tbody id="myTable">
			<c:forEach items="${servico}" var="servicos">
		      <tr>
		      	<td>${servicos.id}</td>
		        <td>${servicos.tipo}</td>
		        <td>${servicos.medico }</td>
		        <td>${servicos.clinica}</td>
		        <td width="6"><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorOleiro}" type="currency"/></td>
		        <td width="6"><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorClinica}" type="currency"/></td>
		        <td width="6"><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorParticular}" type="currency"/></td>
		        <form:form id="myForm" servletRelativeAction="/controlemembros/carrinho/add" method="post">
		        <td width="7"><input width="6" size="6" type="text" name="desconto"></td>
		        <td width="15px">
					<input type="hidden" value="${servicos.id}"name="id">
					<input type="hidden" value="${servicos.tipo}"name="tipo">
					<input type="hidden" value="${servicos.medico}"name="medico">
					<input type="hidden" value="${servicos.amb}"name="amb">
					<input type="hidden" value="${servicos.ch}"name="ch">
					<input type="hidden" value="${servicos.clinica}"name="clinica">
					<input type="hidden" value="${servicos.valorParticular}"name="valorParticular">
					<input type="hidden" value="${servicos.valorClinica}"name="valorClinica">
					<input type="hidden" value="${servicos.valorOleiro}"name="valorOleiro">
					<button type="submit" class="btn btn-success" style="padding: 3px 3px 3px 3px;" ><img src="../resources/imagens/icons8-soma-filled-50.png" width="20px" ></button>																	
				</td>
				</form:form>
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