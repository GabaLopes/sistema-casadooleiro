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

	<style media="print">
	.botao {
	display: none;
	}
	</style>
	<style media="print">
	.boton {
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
	 function mudar(el) {
	        var display = document.getElementById(el).style.display;
	        if(display == "none")
	            document.getElementById(el).style.display = 'block';
	        else
	            document.getElementById(el).style.display = 'none';
	    }
	</script>
	
<title>Guia de Atendimento Médico</title>
</head>
<body class="container-fluid" >
	<div class="row">
  <div class="col-md border border-dark" style="padding-top: 2%;padding-bottom: 2%;"><img src="http://192.168.0.113:8080/controlemembros/resources/imagens/guiamedico.png" width="100%"></div>
       <div class="col-md border border-dark"  style="padding-top: 2%" align="center"><h1><strong>GUIA DE ATENDIMENTO MÉDICO</strong></h1></div>
       <div class="col-md border border-dark" style="padding-top: 2%;padding-bottom: 2%;"><h1><strong>Data de Emissão: <input type="date" style="border-color: #FFFFFF;border: 0 none;outline: 0;box-shadow: 0 0 0 0;font-family: Tahoma; font-size: 35px" ></strong></h1></div>
	</div>
       <br>
       <div>
       <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Credenciado:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" name="nome">
	   </div>
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black" ><h1><strong>Empresa:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control " style="color: black;font-family: Tahoma; font-size: 35px" value="Coopercar">
	   </div>
	   <div class="row">
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Titular:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${carrinhoCompras.titular }">
	   </div>
	   </div>
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Telefone:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${carrinhoCompras.telefoneTitular }">
	   </div>
	   </div>
	   </div>
	   <div class="row">
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1" style="color: black"><h1><strong>Dependente:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${carrinhoCompras.dependente }">
	   </div>
	   </div>
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Telefone:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${carrinhoCompras.telefoneDependente}">
	   </div>
	   </div>
	   
	   </div>
	   
	   
       </div>
       <br>
       <div class="row">
       <div class="col-md-4 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>Descrição dos Serviços</strong></h2></div>
        <div class="col-md-2 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>Médico</strong></h2></div>
        <div class="col-md-5 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>Código do Serviço</strong></h2></div>
        <div class="col-md-1 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>CH</strong></h2></div>
       </div>
     	<c:forEach items="${carrinhoCompras.itens}" var="item" varStatus="status" >
			<div id="minhaDiv${status.index}" >
				<div class="row">
				<div class="col-md-4 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${item.tipo}</h1></div>
				<div class="col-md-2 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${item.medico}</h1></div>
				<div class="col-md-5 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${item.amb}</h1></div>
				<div class="col-md-1 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${item.ch}</h1><button id="boton" class="boton" onclick="Mudarestado('minhaDiv${status.index}')">Excluir</button></div>
				
			</div>	
			</div>
			
			</c:forEach>
			
		<div class="row">
		<div class="col-md-7"><h3><strong>MARCAÇÃO DE CONSULTAS E ASSESSORIA - CNPJ: 16.130.379/0001-94</h3><h2></strong><br><b>* Documento válido apenas com carimbo e assinatura</b></h2></div>
		<div class="col-md-5"><h2><strong>DEUS É FIEL !</strong></h2></div>
		</div>
		<div><h1><b>Não emitimos Nota Fiscal, pois somos uma Entidade Filantrópica.</b></b><br>Fone: (75) 9 9912-5252 - Email: casadooleirosm@gmail.com</h1></div>	<br>
		<div class="row">
		<div class="col-md-6 border border-dark"  style="padding-top: 30px;padding-bottom: 10px" align="center"><h2><strong>_____________________________________________________<br>Associação Beneficente Casa do Oleiro</strong></h2></div>
		<div class="col-md-6 border border-dark"  style="padding-top: 30px;padding-bottom: 10px" align="center"><h2><strong>_____________________________________________________<br>Titular ou Dependente</strong></h2></div>
		</div><br><br>
<div>
_______________________________________________________________________________________________________________________________________________________________________________________		
</div>
<input type="button" class="botao btn btn-warning" value="Imprimir Guia" onClick="window.print()"/>

</body>
</html>