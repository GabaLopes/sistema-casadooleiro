<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE  html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap 4 CSS  -->
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/bootstrap.min.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/stilo.css"  rel="stylesheet" type="text/css" />	
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/w3.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath}/bootstrap.min.js" ></script>
    <c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath }/jquery-3.3.1.slim.min.js"></script>
    <c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/popper.min.js"></script>
	<c:url value="/resources/imagens" var="imgPath"/>
	
	<script type="text/javascript">
	$(document).ready(function() {
	  $("#somar").click(function(){
	    var total = 0;
	    var input = $("#desconto");
	    var inputstr = input.val().replace(",",".");
	    var valor = parseFloat(inputstr);
	    var desconto = valor != "" ? valor : 0;
	    $('.input').each(function(){
	      var valor = Number($(this).val());
	      if (!isNaN(valor)) total += valor;
	    });
	    total = total - desconto;
	    $(".resultado").html(total.toFixed(2));
	    document.getElementById('stotal').value = total.toFixed(2);
	    document.getElementById('sdesconto').value = desconto;
	  });
	});
	</script>
	
	<style media="print">
	.bot {
	display: none;
	background-color: white;
	}
	</style>
	
	<script>
	window.onload = function(){
	document.getElementById('tipo1').value = document.getElementById('tipo2').value;
	}
	</script>
		
	<script type="text/javascript">
  window.onload = function(){
 
    var i = function(id){ return document.getElementById(id); }
     
    i("calcula").onclick = function(){
      var c1 = i("campo1").value;
      var c2 = i("campo2").value;
     i("resultado").innerHTML = parseInt(c1) + parseInt(c2);
    }
  }
    </script>
    <style type="text/css">
    #celula {
    	width:20px;
    }
    
    </style>	
	
	<style media="print">
	.botao {
	display: none;
	}
	</style>
<script type="text/javascript">
function Mudarestado(el) {
    var display = document.getElementById(el).style.display;
    if(display == "none")
        document.getElementById(el).style.display = 'block';
    else
        document.getElementById(el).style.display = 'none';
}
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
<title>Vendas - Casa do Oleiro</title>
</head>
<body class="container-fluid">

<nav class="navbar navbar-expand-sm  navbar-dark fixed-top" style="background-color: #24244E;" >
  <a class="navbar-brand" href="/controlemembros/" style="width: 15%;"><img class="img" src="${imgPath}/casadooleiro.png" width="100%"></a>
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

<div class="container-fluid" style="margin-top: 90px">
			
			<div class="container" align="center">
		    <img src="${imgPath}/guiamedico.png" style=" width:35%" >
			<h4 class="text-primary bot"><strong>Titular:</strong> ${carrinhoCompras.titular}</h4>
			<h5 class="text-secondary bot"><strong>Dependente:</strong> ${carrinhoCompras.dependente}</h5>
			</div>
			<br>
			<table>
				<thead>
					<tr>
						<th class="bot"><button type="button" onclick="window.location.href='carrinho/atendimento'" class="btn btn-info float-left">Adicionar Mais Serviços</button>
						<form:form servletRelativeAction="${s:mvcUrl('CCC#cancelar').build()}" method="post" class="float-left" style="margin-left:5px; "><button type="submit" class="btn btn-danger" >Cancelar Atendimento</button></form:form>
										
						<form:form target="_blank"  servletRelativeAction="${s:mvcUrl('CCC#guiageral').build()}" class="float-left " style="margin-left:5px;" method="post">
	 								<input type="hidden" value="${carrinhoCompras.titular }" name="titular">
	 								<input type="hidden" value="${carrinhoCompras.dependente }" name="dependente">
	 								<input type="hidden" value="${carrinhoCompras.empresa }" name="empresa">
	 								<input type="hidden" value="${carrinhoCompras.telefoneTitular}" name="telefoneTitular">
	 								<input type="hidden" value="${carrinhoCompras.telefoneDependente}" name="telefoneDependente">
	 								
	 							<c:forEach items="${carrinhoCompras.itens}" var="item" varStatus="status" >
	 								<input type="hidden" value="${item.tipo }" name="itens[${status.index}].tipo">
	 								<input type="hidden" name="itens[${status.index}].clinica" value="${item.clinica}">
									<input type="hidden" name="itens[${status.index}].medico" value="${item.medico}">
									<input type="hidden" name="itens[${status.index}].valor" value="${item.valor}">
									<input type="hidden" name="itens[${status.index}].amb" value="${item.amb}">
									<input type="hidden" name="itens[${status.index}].ch" value="${item.ch}">
	 							</c:forEach>
	 							<button type="submit" class="btn btn-warning text-white">Guia Médico Personalizado</button>
						</form:form>
						
						</th>
					</tr>
				</thead>
			</table>
			<table class="table table-bordered">
					<thead>
						<tr class="barra">
							<th class="bg-primary text-white">Serviço Médico</th>
							<th class="bg-primary text-white">Valor</th>
							<th class="bg-primary text-white bot">CH</th>
							<th class="bg-primary text-white">Clinica</th>
							<th class="bg-primary text-white">Médico</th>
							<th class="bg-primary text-white"></th>
							<th class="bg-primary text-white"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${carrinhoCompras.itens}" var="item" varStatus="status" >
							<tr>
								<td><img width="3%" src="${imgPath}/serv.png"> <strong class="text-secondary">${item.tipo}</strong></td>
								<td id="campo1" ><div class="input-group">
 								 <span class="input-group-addon text-secondary"><strong>R$ ${carrinhoCompras.getValor(item)}</strong> </span>
 								 </div></td>
 								<td  class="text-secondary bot"><b>${item.ch}</b></td>
 								<td class="text-secondary"><strong>${item.clinica}</strong></td>
								<td class="text-secondary"><strong>${item.medico}</strong></td>
								<td>
									<form:form servletRelativeAction="/carrinho/remover" method="post">
										<input type="hidden" name="item" value="${status.index}">
										<button type="submit" class="btn btn-danger bot">Excluir</button>
									</form:form>
								</td>
								<td>
								<form:form name="meu_form" servletRelativeAction="/carrinho/guiamedico" method="post">
										<input type="hidden" name="itens[0].clinica" value="${item.clinica}">
										<input type="hidden" name="itens[0].medico" value="${item.medico}">
										<input type="hidden" name="itens[0].tipo" value="${item.tipo}">
										<input type="hidden" name="itens[0].valor" value="${item.valor}">
										<input type="hidden" name="itens[0].amb" value="${item.amb}">
										<input type="hidden" name="itens[0].ch" value="${item.ch}">
										<input type="hidden" name="titular" value="${carrinhoCompras.titular}">
										<input type="hidden" name="telefoneTitular" value="${carrinhoCompras.telefoneTitular}">
										<input type="hidden" value="${carrinhoCompras.empresa }" name="empresa">
										<input type="hidden" name="telefoneDependente" value="${carrinhoCompras.telefoneDependente}">
										<input type="hidden" name="dependente" value="${carrinhoCompras.dependente}">
										<button type="submit" class="btn btn-warning text-white bot" formtarget="_blank">Guia Médico</button>
								</form:form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td class="bg-white">
								<form:form servletRelativeAction="${s:mvcUrl('PC#finalizar').build()}" method="post">
									<div class="input-group mb-3 float-right" >
									<div class="input-group-prepend">
						    		<div>
						    		<label><b>Cartão:</b></label>
						  			<input class="input-group" type="text" size="8" required="required" name="cartao" placeholder="Cartão"/>
						    		</div>
						    		<div style="padding-left:10px;">
						  			<label><b>Dinheiro:</b></label>
						  			<input class="input-group" type="text" size="8" required="required" name="dinheiro" placeholder="Dinheiro"/><br>
						    		</div>
						  			</div>
								    </div>
								    <input type="hidden" name="total" value="${carrinhoCompras.total }" id="stotal" />
								    <input type="hidden" name="desconto" value="0" id="sdesconto" />
									<input type="submit" name="checkout"
									value="Finaliza Compra" class="btn btn-success bot" >
							   </form:form><br>
						  	</td>
							<td>
							
							<b>Sub-Total:</b> <input type="text" value="${carrinhoCompras.total}" disabled="disabled" class="input input-group" />
								<br>
								<b>Desconto:</b><br>
								
								<input class="input-group" type="text" id="desconto" />
								<input type="button" class="btn btn-primary" value="Aplicar Desconto" id="somar" />
								
								<br />
								<h5 class="text-success"><b>Total: R$ <span class="resultado" id="resultado">${carrinhoCompras.total}</span></b></h5>
 							</td>
 							<td>
 							<p class="text-primary"><b class="bot">CH ${totalch}</b></p>
 							</td>
 							<td></td>
 							<td></td> 							 								
						</tr>
					</tfoot>
				</table>
				<table>
					<thead>
						<tr>
						<th></th>
						<th></th>
						<th></th>
						</tr>
					</thead>
				</table>
</div>
 
</body>

</html>