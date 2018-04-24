<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Clínicas</title>
</head>

<body class="container-fluid">
 <div class="container" style="padding-top:5%;">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Casa do Oleiro</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="#">Atendimento</a></li>
	      <li><a href="#">Relátorios</a></li>
	      <li><a target="_self" href="/controlemembros/clientes/form" >Cadastro Clientes</a></li>
	      <li><a href="#">Cadastro Serviço Médico</a></li>
	    </ul>
	  </div>
	</nav>
		<div class="panel panel-primary">
	      <div class="panel-heading">Cadastrar - Clínica</div>
	      <div class="panel-body">
			<form:form action="/controlemembros/clinicas/adicionar" method="post" >
				<div class="container-fluid">
					<label>Clínica:</label>
					<input type="text" name="nome">
					<button type="submit" class="btn btn-success" >Cadastrar</button>
				</div><br>
				${sucessos }
			</form:form>
		  </div>
	    </div>
	</div>		
</div>

<div class="panel panel-primary">
   <div class="panel-heading">Cadastrar - Serviço Médico</div>
      <div class="panel-body">
		<form:form class="form-inline" action="/controlemembros/clinicas" method="post" >
			<div class="container-fluid">
				<label>Clínica:</label>
				<table class="table table-bordered">
					<select name="clinica">
						<c:forEach items="${clinica}" varStatus="status">
						 <option value="${clinica[status.index].nome}">${clinica[status.index].nome}</option>
						</c:forEach>
					</select>
				</table>
						<div class="form-group">
						 <label>Serviço Médico:</label>
						  <input type="text" name="tipo">
						 </div> 
						 <div class="form-group">	
						 	<label>Médico:</label>
						 	<input type="text" name="medico">
						 </div>	
						 <div class="form-group">
							<label>CH:</label>
							<input type="number" step="0.001" name="ch">
						 </div>
						 <div class="form-group">
						 	<label>AMB:</label> 
						 	<input type="text" name="amb">
						 </div>	
						 <div class="form-group">
							<label>Valor:</label> <input
							type="text" name="valorOleiro">
						 </div>	
						 <div class="form-group">	
							<label>Preço de	Custo:</label>
							<input type="text" name="valorClinica">
						 </div>	
						 <div class="form-group">
						 	<label>Valor Particular:</label>
							<input type="text" name="valorParticular">
						 </div><br><br>	
						<button type="submit" class="btn btn-success">Cadastrar</button>
						</form:form>
						${sucesso }<br>
						<br>
						<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control" id="myInput" type="text" placeholder="Procurar Serviço..."></div>
						<br><br>						
						<table class="table table-bordered">
						    <thead>
						      <tr>
						      	<th>Id</th>
						        <th>Serviço</th>
						        <th>Médico</th>
						        <th>Clínica</th>
						        <th>Valor</th>
						      </tr>
						    </thead>
						    <tbody id="myTable">
						      
								<c:forEach items="${servico}" var="servicos">
								      <tr>
								      	<td>${servicos.id}</td>
								        <td>${servicos.tipo}</td>
								        <td>${servicos.medico }</td>
								        <td>${servicos.clinica}</td>
								        <td>${servicos.valorOleiro}</td>
								        <td><form:form action="/controlemembros/clinicas/excluir">
											<input type="hidden" value="${servicos.id}"name="id">
											<button type="submit" class="btn btn-danger">Excluir</button>																	
											</form:form>
										</td>
									  </tr>  			  
								</c:forEach>
								 
  						    </tbody>
				   	  </table>
				</div>
		 	</div>
	   
				
</body>
</html>