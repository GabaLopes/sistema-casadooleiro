<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Cadastro de Associado</title>
</head>
<body style="background-color: #206F8B;">
	<div class="container">
		<div class="row">
		
			<div class="col-md-6">
				<div class="panel-group">
					<div class="panel panel-default">
				   		 <div class="panel-body">
					      	<form action="/controlemembros/clientes" method="post">
								<strong><h4>Adicionar Cliente</h4></strong><br><br>
								<div class="form-group">
								<label>Data de Cadastro:</label>
								<input type="text" name="dataCadastro" />
								</div>
								<div class="form-group">
								<label>Nome Completo:</label>
								<input type="text" name="nome" />
								</div>
								<div class="form-group">	
								<label>Telefone:</label>
									<input type="text" name="telefone">
								</div>
								<div class="form-group">
								<label>Nome Dependente:</label>
									<input type="text" name="dependente[0].nome">
								</div>
								<div class="form-group">
								<label>Data Nascimento:</label>
									<input type="text" name="dependente[0].dataNascimento">		
								</div>
								<div class="form-group">
								<label>Telefone:</label>
									<input type="text" name="dependente[0].telefone">		
								</div><br><br>
								<button type="submit" class="btn btn-success">Cadastrar</button>
							</form>
						</div>
			   	 	</div>
		 	  	</div>
			</div>
			<div class="col-md-6">
				<div class="panel-group">
					<div class="panel panel-default">
				    	<div class="panel-body">	
							<form:form  action="/controlemembros/clientes/adicionardependente" >
								<strong><h4>Adicionar Dependente</h4></strong><br><br>
								<div class="form-group">
								<label>ID do Cliente</label>
								<input size="3" type="text" name="id">
								</div>
								<div class="form-group">
								<label>Nome do Dependente</label>
								<input size="40" type="text" name="nome">
								</div>
								<div class="form-group">
								<label>Data de Nascimento</label>
								<input type="text" name="dataNascimento">
								</div>
								<div class="form-group">
								<label>Telefone</label>
								<input type="text" name="telefone">
								</div><br><br>		
								<button type="submit" class="btn btn-success">Inserir</button>
							</form:form>
					  	</div><br>
					</div>
				</div>
			</div>
		</div>	
	</div>	
		

		
	
	<div class="container">
	<div class="panel-group">
					<div class="panel panel-default">
				    	<div class="panel-body">
				    		<strong><h4>Geral</h4></strong><br>
					    	<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control" id="myInput" type="text" placeholder="Procurar Cliente..."></div>
							<br>						
								<table class="table table-bordered">
									 <thead>
								      <tr>
								     	<th>Id</th>
								     	<th>Data de Cadastro</th>
								      	<th>Nome</th>
								        <th>Telefone</th>
								        <th>Dependente</th>	                
								      </tr>
								    </thead>
								    <tbody id="myTable">
										<c:forEach items="${clientes}" var="cliente"  >
											<tr>
												<td>${cliente.id}</td>
												<td><fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.dataCadastro.time}"/></td>
												<td>${cliente.nome}</td>
												<td>${cliente.telefone}</td>
												<td><a href="${ s:mvcUrl('CC#detalhes').arg(0,cliente.id).build() }">Ver Dependentes</a></td>
												<td>
												<form:form action="/controlemembros/clientes/excluir">
												<input type="hidden" value="${cliente.id}"name="id">
												<button type="submit" class="btn btn-danger">Excluir</button>																	
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
	</body>
</html>