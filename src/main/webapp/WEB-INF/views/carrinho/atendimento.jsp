<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
	
	<c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/jquery.js"></script>
	<c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/jquery.form.js"></script>
	
	<script type="text/javascript">
	        function mascara(horario){ 
	            if(horario.value.length == 2)
	                horario.value = horario.value + ':'; //quando começamos a digitar, o script irá inserir um parênteses no começo do campo.
	           
	}
	    </script>
  	
  	 
	<script type="text/javascript"> 
	
    // wait for the DOM to be loaded 
    $(document).ready(function() { 
        // bind 'myForm' and provide a simple callback function 
        $('#myForm').ajaxForm(function() { 
        	var div = document.getElementById("textDiv");
        	div.style.display ='block';
            div.textContent = "Serviço Adicionado Com Sucesso";
            var text = div.textContent;
            setTimeout(function() {
        		div.style.display = 'none';
        		
        	}, 1000);
           
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


<div class="container-fluid" style="margin-top: 80px;">
<div align="center"><h4 class="text-success"><strong>${vendasucesso} </strong></h4></div>

<div class="card" style="background-color: #F4F4F4">
		<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">ATENDIMENTO AO CLIENTE</h6></div>
		<div class="card-body">
<div><button type="button" class="btn btn-primary" onclick="window.location.href='../carrinho'">Ir Para o Carrinho</button><button class="btn btn-info" style="margin-left:10px " onclick="document.getElementById('id01').style.display='block'">Adicionar Cliente</button><security:authorize ifAnyGranted="ROLE_ADMIN"><button class="btn btn-info" style="margin-left:10px " onclick="document.getElementById('id02').style.display='block'">Vendas</button></security:authorize>
<button class="btn btn-info" style="margin-left:10px " onclick="document.getElementById('marcacao').style.display='block'">Marcação de Consultas</button>
<button onclick="window.location.href='../carrinho/vermarcacoes'" class="btn btn-info" style="margin-left:10px " >Ver Consultas Marcadas</button>
</div>
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
				<c:forEach items="${clientes}" var="cliente" varStatus="status">
					<tr>
						<td><p>${cliente.nome}</p>
						<form:form servletRelativeAction="/controlemembros/carrinho/addCliente" method="post">
								<input type="hidden" name="titular" value="${cliente.nome}">
								<input type="hidden" name="telefone" value="${cliente.telefone}">
								<input type="hidden" name="empresa" value="${cliente.empresa}">	
								<button type="submit" class="btn btn-success">Inserir</button>
						</form:form>
						</td>
						<td>
						<form:form servletRelativeAction="/controlemembros/carrinho/addCliente" method="post">
								<input type="hidden" name="idTitular" value="${cliente.id}">
								<input type="hidden" name="titular" value="${cliente.nome}">
								<input type="hidden" name="empresa" value="${cliente.empresa}">								
								<select class="form-control" name="dependente">
									<c:forEach items="${cliente.dependente}" var="depen" varStatus="status">
										<option value="${status.index}">${depen.nome}</option>
									</c:forEach>
								</select>
								<button type="submit" class="btn btn-primary " >Inserir</button>
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
	    <!-- Modal 02 -->
	    
	    <div id="marcacao" class="w3-modal ">
	    <div class="w3-modal-content w3-animate-zoom">
	      <header class="w3-container w3-teal"> 
	        <span onclick="document.getElementById('marcacao').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2>Marcação de Consultas</h2>
	      </header>
	      <div class="w3-container">
			<div style="height:400px; overflow: auto;padding-top:10px ">
			<form:form servletRelativeAction="/controlemembros/carrinho/marcacao" method="post">
			<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Atendente</span>
	    	<select class="form-control" name="atendente">
				<option value="Lucas Lopes">Lucas Lopes</option>
				<option value="Marcos Emanuel">Marcos Emanuel</option>
				<option value="Raquel Lopes">Raquel Lopes</option>
				<option value="José Raimundo">José Raimundo</option>
			</select>
	  		</div>
			
			</div>
			
			<div class="input-group mb-3" style="width: 30%">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data</span>
	  		</div>
			<input type="text" name="data" required="required" class="form-control" >
			</div>
			
			<div class="input-group mb-3" style="width: 30%">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Horário</span>
	  		</div>
			<input type="text" name="horario" maxlength="5" onkeypress="mascara(this)" class="form-control" >
			</div>
			
			<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Paciente</span>
	  		</div>
			<input type="text" name="paciente" class="form-control">
			</div>
			
			<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Clínica</span>
	  		</div>
			<input type="text" name="clinica" class="form-control">
			</div>
			
			
			<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Procedimentos</span>
	  		</div>
			<textarea cols="100" name="procedimentos" required="required" class="form-control"></textarea>
			</div>
			
			<button type="submit" class="btn btn-success">Marcar</button>
			
			</form:form> 
						
			</div>
			
			</div>
	      </div>
	    </div>
	    
	    
	    
	    	    
	    
	    <!-- Modal 03 -->
	    <div id="id02" class="w3-modal ">
	    <div class="w3-modal-content w3-animate-zoom">
	      <header class="w3-container w3-teal"> 
	        <span onclick="document.getElementById('id02').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2>Vendas</h2>
	      </header>
	      <div class="w3-container">
	        <div style="height:400px; overflow: auto;padding-top:10px ">
			<form:form target="_blank" servletRelativeAction="/controlemembros/carrinho/vendas" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Inicial</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataIni">
  		</div>
  		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Final</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataFim">
  		</div>
  		<button type="submit" class="btn btn-success">Gerar</button>
		</form:form>			
			</div>
			
			</div>
	      </div>
	    </div>
  	<br>
  	<p class="text-success"><b>${sucessos}</b></p><p class="text-success"><b>${sucesso}</b></p><div class="text-success" id="textDiv"></div>
<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control" id="myInput" type="text" placeholder="Procurar Serviço..."></div>
	<table class="table table-bordered" style="background-color: lightgray"><thead><tr>
			<th  width="3.7%">Id</th>
	        <th width="28.5%">Serviço</th>
	        <th width="19.8%">Médico</th>
	        <th width="12%">Clínica</th>
	        <th width="5%">Valor</th>
	        <th width="5%">Custo</th>
	        <th width="6.5%">Part.</th>
	        <th width="2.5%">CH</th>
	        </tr></thead></table>
	<div style="height:400px; overflow: auto; ">
	<table class="table table-bordered">
	    <thead>
	      <tr>
	      
	      </tr>
	    </thead>
	    <tbody id="myTable">
			<c:forEach items="${servico}" var="servicos" varStatus="status">
		      <tr  id="td${status.index}">
		      	<td  width="25">${servicos.id}</td>
		        <td width="29%"><b>${servicos.tipo}</b></td>
		        <td  width="20%">${servicos.medico }</td>
		        <td width="12%">${servicos.clinica}</td>
		        <td width="5%"><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorOleiro}" type="currency"/></td>
		        <td width="6" style="color:#D40000;" ><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorClinica}" type="currency"/></td>
		        <td width="6" style="color:#0009FF;" ><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${servicos.valorParticular}" type="currency"/></td>
		        <td width="6">${servicos.ch}</td>
		        <form:form id="myForm" servletRelativeAction="/controlemembros/carrinho/add" method="post">
		        <td width="5%">
					<input type="hidden" value="${servicos.id}"name="id">
					<input type="hidden" value="${servicos.tipo}"name="tipo">
					<input type="hidden" value="${servicos.medico}"name="medico">
					<input type="hidden" value="${servicos.amb}"name="amb">
					<input type="hidden" value="${servicos.ch}"name="ch">
					<input type="hidden" value="${servicos.clinica}"name="clinica">
					<input type="hidden" value="${servicos.valorParticular}"name="valorParticular">
					<input type="hidden" value="${servicos.valorClinica}"name="valorClinica">
					<input type="hidden" value="${servicos.valorOleiro}"name="valorOleiro">
					<button type="submit" class="btn btn-success" onclick="document.getElementById('td${status.index}').style.color='red'" style="padding: 5px 5px 5px 5px" ><img src="../resources/imagens/icons8-soma-filled-50.png" width="20px" ></button>																	
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
	
<script type="text/javascript">
	var div = document.getElementById('textDiv');

	setTimeout(function() {
		div.style.display = 'none';
		
	}, 3000);
</script>


</body>
</html>