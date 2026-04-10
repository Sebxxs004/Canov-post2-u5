<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Confirmacion</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
	<h1>Compra confirmada</h1>
	<p>Gracias por tu compra. Tu pedido fue registrado correctamente.</p>

	<c:if test="${not empty items}">
		<h2>Resumen</h2>
		<table>
			<thead>
				<tr>
					<th>Producto</th>
					<th>Cantidad</th>
					<th>Subtotal</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="total" value="0" />
				<c:forEach var="it" items="${items}">
					<tr>
						<td>${it.producto.nombre}</td>
						<td>${it.cantidad}</td>
						<td><fmt:formatNumber value="${it.subtotal}" type="currency" currencySymbol="$" /></td>
					</tr>
					<c:set var="total" value="${total + it.subtotal}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><strong>Total pagado</strong></td>
					<td><strong><fmt:formatNumber value="${total}" type="currency" currencySymbol="$" /></strong></td>
				</tr>
			</tfoot>
		</table>
	</c:if>

	<p>
		<a href="${pageContext.request.contextPath}/catalogo">Volver al catalogo</a>
	</p>
</body>
</html>
