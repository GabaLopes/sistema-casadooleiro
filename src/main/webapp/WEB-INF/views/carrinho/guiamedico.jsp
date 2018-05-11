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
<!-- Bootstrap 4 CSS  -->
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/bootstrap.min.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/stilo.css"  rel="stylesheet" type="text/css" />	
	<c:url value="/resources/js" var="jsPath"/>
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/w3.css"  rel="stylesheet" type="text/css" />
    <script src="${jsPath}/bootstrap.min.js" ></script>
    <c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath }/jquery-3.3.1.slim.min.js"></script>
    <c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/popper.min.js"></script>
	<style media="print">
	.botao {
	display: none;
	}
	</style>
<title>Guia Médico</title>
</head>
<body class="container-fluid">
<div align="center"><input type="button" class="botao btn btn-success" value="Imprimir Relátorio" onClick="window.print()"/></div>
<div class="row">
       <div class="col-md border border-dark" style="padding-top: 2%;padding-bottom: 2%;"><img src="http://192.168.0.113:8080/controlemembros/resources/imagens/guiamedico.png" width="100%"></div>
       <div class="col-md border border-dark"  style="padding-top: 2%" align="center"><h1><strong>GUIA DE ATENDIMENTO MÉDICO</strong></h1></div>
       <div class="col-md border border-dark" style="padding-top: 2%;padding-bottom: 2%;"><h1><strong>Data de Emissão: <input type="date" style="border-color: #FFFFFF;border: 0 none;outline: 0;box-shadow: 0 0 0 0;font-family: Tahoma; font-size: 35px" ></strong></h1></div>
       </div><br>
       <div>
       <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Credenciado:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${compra.itens[0].clinica}" name="nome">
	   </div>
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black;" ><h1><strong>Empresa Conveniada:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control " style="color: black;font-family: Tahoma; font-size: 35px" value="Coopercar">
	   </div>
	   <div class="row">
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Titular:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${compra.titular}">
	   </div>
	   </div>
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Telefone:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${compra.telefoneTitular}">
	   </div>
	   </div>
	   </div>
	   <div class="row">
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1" style="color: black"><h1><strong>Dependente:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${compra.dependente }">
	   </div>
	   </div>
	   <div class="col-md">
	   <div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"  style="color: black"><h1><strong>Telefone:</strong></h1></span>
	  		</div>
	  		<input type="text"  class="form-control" style="color: black;font-family: Tahoma; font-size: 35px" value="${compra.telefoneDependente}">
	   </div>
	   </div>
	   
	   </div>
	   
	   
       </div>
       <br>
       <div class="row">
       <div class="col-md-5 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>Descrição dos Serviços</strong></h2></div>
        <div class="col-md-2 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>Médico</strong></h2></div>
        <div class="col-md-4 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>Código do Serviço</strong></h2></div>
        <div class="col-md-1 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h2><strong>CH</strong></h2></div>
       </div>
     	<c:forEach items="${carrinhoCompras.itens}" var="item" varStatus="status" >
			<div id="minhaDiv${status.index}" >
				<div class="row">
				<div class="col-md-5 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${compra.itens[0].tipo}</h1></div>
				<div class="col-md-2 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${compra.itens[0].medico}</h1></div>
				<div class="col-md-4 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${compra.itens[0].amb}</h1></div>
				<div class="col-md-1 border border-dark" style="padding-top: 10px;padding-bottom: 10px"><h1>${compra.itens[0].ch}</h1></div>
							
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
		</div><br><br><br>
		
<div>____________________________________________________________________________________________________________________________________________________________________________________</div><br><br><br>
		
		

</body>
</html>