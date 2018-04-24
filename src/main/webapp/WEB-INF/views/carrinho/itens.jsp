<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
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
<title>Vendas - Casa do Oleiro</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>Serviço Médico</th>
			        <th>Valor</th>
			        <th>Clinica</th>
			        <th>Médico</th>
			       			        
			      </tr>
			    </thead>
			    <tbody>
			      <c:forEach items="${carrinhoCompras.itens}" var="item">
			      <tr>
			       	<td>${item.tipo}</td>
			       	<td>${carrinhoCompras.getValor(item)}</td>
			       	<td>${item.clinica}</td>
			       	<td>${item.medico}</td>
			        <td>
			        	<form action="" method="post">
			        		<button type="submit" alt="excluir">Excluir</button>			        	
			        	</form>
			        </td>			       
			      </tr>
			      </c:forEach>			      
			    </tbody>
			    <tfoot>
			    	<tr>
			    		<td><input type="submit" name="checkout" value="Finaliza Compra"></td>
			    		<td>${carrinhoCompras.total}</td>
			    	</tr>
			    </tfoot>
		  	</table>
		</div>
		<div class="col-md-2"></div>	
	</div>

</div>

</body>
</html>