<%@ tag pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="pagina" required="false" %>

<div class="col-xs-12 col-md-10 col-md-push-2">
	<jsp:doBody />
</div>

<div class="col-xs-12 col-md-2 col-md-pull-10">
	<ul class="nav nav-pills nav-stacked">
		<li class="${pagina == 'lista' ? 'active' : '' }">
			<a href="<c:url value="/a/usuario/todos" />">Todos usuários</a>
		</li>
		<li class="${pagina == 'novo' ? 'active' : '' }">
			<a href="<c:url value="/a/usuario/novo" />">Inserir usuário</a>
		</li>
	</ul>
</div>