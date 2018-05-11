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
	<c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/jquery.min.js"></script>
			
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
<title>Cadastro de Associado</title>
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

<div class="container-fluid" style="margin-top:80px;">
<div class="row">
<div class="col-md-6 float-left">
		<form:form class="form-group" servletRelativeAction="/controlemembros/clientes" method="post">
		<div class="card">
			<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Cadastrar Cliente</h6></div>
			<div class="card-body">
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Data de Cadastro</span>
	  			</div>
				<input class="form-control" type="date" required="required" id="example-date-input"
					name="dataCadastro">
			</div>	
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Nome</span>
	  			</div>
	  			<input type="text" class="form-control" required="required" name="nome" />
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Data de Nascimento</span>
	  			</div>
	  			<input type="date" class="form-control" name="dataNascimento">
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">CPF</span>
	  			</div>
	  			<input type="text" class="form-control" onkeypress="mascar(this)" maxlength="14" id="cpf" required="required" name="cpf" />
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Telefone</span>
	  			</div>
	  			<input type="text" class="form-control" id="telefone" maxlength="15"  onkeypress="mascara(this)" required="required" name="telefone">
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Telefone 2</span>
	  			</div>
	  			<input type="text" class="form-control" id="telefone" maxlength="15"  onkeypress="mascara(this)" required="required" name="telefone2">
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Cidade</span>
	  			</div>
	  			<input type="text" class="form-control" name="cidade">
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Endereço</span>
	  			</div>
	  			<input type="text" class="form-control" name="endereco">
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Bairro</span>
	  			</div>
	  			<input type="text" class="form-control" name="bairro">
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">CEP</span>
	  			</div>
	  			<input type="text" class="form-control" name="cep">
		</div>
		<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Empresa</span>
	  			</div>
	  			<input type="text" class="form-control" name="empresa">
		</div>
		
		<br>
		<button type="submit" class="btn btn-success">Cadastrar</button>
	</div>
	</div>
	</form:form>
	<p class="text-success">${sucesso }</p>
</div>	
	
<div class="col-md-6 float-right">
	
	<form:form servletRelativeAction="/controlemembros/clientes/adicionardependente">
		<div class="card">
				<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Cadastrar Dependente</h6></div>
				<div class="card-body">
				<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">ID do Titular</span>
	  			</div>
	  			<input width="20px" class="form-control"  required="required" type="text" name="id">
				</div>
				<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Nome do Dependente</span>
	  			</div>
	  			<input size="40" required="required" class="form-control" type="text" name="nome">
				</div>
				<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Data de Nascimento Dependente</span>
	  			</div>
	  			<input type="date" class="form-control" name="dataNascimento">
				</div>
				<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">CPF</span>
	  			</div>
	  			<input type="text" class="form-control" onkeypress="mascar(this)" maxlength="14" id="cpf" name="dependenteCpf">
				</div>
				<div class="input-group mb-3">
						<div class="input-group-prepend">
			    		<span class="input-group-text" id="basic-addon1">Telefone Dependente</span>
			  			</div>
			  			<input type="text" class="form-control" id="telefone" onkeypress="mascara(this)"  maxlength="15" name="dependenteTelefone">
				</div>
				<div class="input-group mb-3">
						<div class="input-group-prepend">
			    		<span class="input-group-text" id="basic-addon1">Telefone 2 Dependente</span>
			  			</div>
			  			<input type="text" class="form-control" id="telefone" onkeypress="mascara(this)"  maxlength="15" name="dependenteTelefone2">
				</div>
				<div class="input-group mb-3">
						<div class="input-group-prepend">
			    		<span class="input-group-text" id="basic-addon1">Cidade</span>
			  			</div>
			  			<input type="text" class="form-control" name="dependenteCidade">
				</div>
				<div class="input-group mb-3">
						<div class="input-group-prepend">
			    		<span class="input-group-text" id="basic-addon1">Bairro</span>
			  			</div>
			  			<input type="text" class="form-control" name="dependenteBairro">
				</div>
				<div class="input-group mb-3">
						<div class="input-group-prepend">
			    		<span class="input-group-text" id="basic-addon1">Endereço</span>
			  			</div>
			  			<input type="text" class="form-control" name="dependenteEndereco">
				</div>
				<div class="input-group mb-3">
						<div class="input-group-prepend">
			    		<span class="input-group-text" id="basic-addon1">CEP</span>
			  			</div>
			  			<input type="text" class="form-control" name="dependenteCep">
				</div>
				<br>
				<br>
				<button type="submit" class="btn btn-success">Inserir</button>
			</div>
		</div>
	</form:form>
	<p class="text-success">${dependentesucesso}</p>	
</div>	

</div>
</div>	
	
<div class="container-fluid col-md-12" >
	<div class="card">
	<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Buscar Cliente</h6></div>
	<div class="card-body">
	<div class="input-group mb-3">
				<div class="input-group-prepend">
	    		<span class="input-group-text" id="basic-addon1">Procurar Cliente</span>
	  			</div>
	  			<input class="form-control"	id="myInput" type="text" placeholder="Digite aqui o nome do titular...">
	</div>
	<div  style="height:300px; overflow: auto;">
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
			<c:forEach items="${clientes}" var="cliente">
				<tr>
					<td>${cliente.id}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy"
							value="${cliente.dataCadastro.time}" /></td>
					<td>${cliente.nome}</td>
					<td>${cliente.telefone}</td>
					<td><a
						href="${ s:mvcUrl('CC#detalhes').arg(0,cliente.id).build() }">Ver
							Dependentes</a></td>
					<td width="3%"><form:form
							servletRelativeAction="/controlemembros/clientes/excluir">
							<input type="hidden" value="${cliente.id}" name="id">
							<button type="submit" class="btn btn-danger"><img id="image-1" alt="" width="15px" src="../resources/imagens/lixo.png"/></button>
						</form:form></td>
					<td width="3%"><form:form
							servletRelativeAction="/controlemembros/clientes/atualizar" method="GET">
							<input type="hidden" value="${cliente.id}" name="id">
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