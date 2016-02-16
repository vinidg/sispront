<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>

<dti:template title="SisATIH | Alteração de permissões do usuário"
	pagina="usuarios">
	<dti:usuario>
		<ol class="breadcrumb">
			<li><a href="<c:url value="/a/solicitacao/abertas"/>">Home</a></li>
			<li><a href="<c:url value="/a/usuario/todos"/>">Usuários</a></li>
			<li class="active">Papéis</li>
		</ol>
		<c:url value="/a/usuario/${usuario.id}/papeis" var="action" />
		<form:form action="${action}" method="post">
			<div class="form-group">
				<label>Nome:</label>
				<p class="form-control-static">${usuario.nome}</p>
			</div>
			<div class="form-group">
				<label>Papéis:</label>
				<c:forEach items="${papeis}" var="papel" varStatus="i">
					<div>
						<label style="font-weight: normal;"> <input
							name="pedidos[${i.count - 1}].ativa" type="checkbox"
							${papel.ativa ? "checked" : ""}> <input
							name="pedidos[${i.count - 1}].papel.nome" type="hidden"
							value="${papel.papel.nome}"> ${papel.papel.nome}
						</label>
					</div>
				</c:forEach>
			</div>
			<div class="form-group text-right">
				<button class="btn btn-primary">Alterar papéis</button>
			</div>
		</form:form>

	</dti:usuario>
</dti:template>