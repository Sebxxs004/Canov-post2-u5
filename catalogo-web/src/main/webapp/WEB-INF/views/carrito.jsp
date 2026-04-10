<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Carrito</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
	<h1>Carrito de compras</h1>

	<c:choose>
		<c:when test="${empty items}">
			<p>Tu carrito esta vacio.</p>
		</c:when>
		<c:otherwise>
			<table>
				<thead>
					<tr>
						<th>Producto</th>
						<th>Categoria</th>
						<th>Precio unitario</th>
						<th>Cantidad</th>
						<th>Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="total" value="0" />
					<c:forEach var="it" items="${items}">
						<tr>
							<td>${it.producto.nombre}</td>
							<td>${it.producto.categoria}</td>
							<td>
								<fmt:formatNumber value="${it.producto.precio}" type="currency" currencySymbol="$" />
							</td>
							<td>${it.cantidad}</td>
							<td>
								<fmt:formatNumber value="${it.subtotal}" type="currency" currencySymbol="$" />
							</td>
						</tr>
						<c:set var="total" value="${total + it.subtotal}" />
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"><strong>Total</strong></td>
						<td>
							<strong>
								<fmt:formatNumber value="${total}" type="currency" currencySymbol="$" />
							</strong>
						</td>
					</tr>
				</tfoot>
			</table>
		</c:otherwise>
	</c:choose>

	<div>
		<a href="${pageContext.request.contextPath}/catalogo">Seguir comprando</a>
		<c:if test="${not empty items}">
			<form method="post" action="${pageContext.request.contextPath}/carrito" style="display:inline; margin-left:12px;">
				<input type="hidden" name="accion" value="limpiar">
				<button type="submit">Limpiar carrito</button>
			</form>
		</c:if>
	</div>
</body>
</html>
