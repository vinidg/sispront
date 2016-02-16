<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<dti:template title="SisATIH | Alterar senha do usuário"
	cssFiles="form.css" jsFiles="solicitacao/mensagens.js">

	<div class="col-xs-12 container">
		<h4>Alterar senha</h4>

		<spring:hasBindErrors htmlEscape="true" name="senhaParaFormulario">
			<font color="red"> <c:forEach items="${errors.allErrors}"
					var="error">
					<spring:message text="${error.defaultMessage}" />
					<br />
				</c:forEach>
			</font>
		</spring:hasBindErrors>

		<c:if test="${not empty msgSucesso}">
			<div class="alert alert-success" role="alert">${msgSucesso}</div>
		</c:if>

		<c:url value="/a/usuario/altera-senha" var="action" />
		<form:form id="formulario-cadastro" method="post"
			class="form-horizontal" action="${action}">

			<div class="form-group">
				<label for="senha" class="col-sm-2 control-label">Senha</label>
				<div class="col-sm-6">
					<input id="senha" class="form-control"
						name="senha" type="password">
				</div>
			</div>

			<div class="form-group">
				<label for="confirmacao-senha" class="col-sm-2 control-label">Confirmar
					de senha:</label>
				<div class="col-sm-6">
					<input name="senhaConfirmacao"
						id="confirmacao-senha" class="form-control" type="password">
				</div>
			</div>

			<div class="form-group text-right">
				<div class="col-sm-offset-2 col-sm-6">
					<button class="btn btn-primary">Alterar senha</button>
				</div>
			</div>

		</form:form>
	</div>
</dti:template>