<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<dti:template title="SisSoPront | Alterar usuário" cssFiles="form.css"
	jsFiles="solicitacao/MaskFormularios.js,acao.js,solicitacao/mensagens.js"
	pagina="usuarios">
	<dti:usuario>
		<ol class="breadcrumb">
			<li><a href="<c:url value="/a/solicitacao/home"/>">Home</a></li>
			<li><a href="<c:url value="/a/usuario/todos"/>">Usuários</a></li>
			<li class="active">Dados Cadastrais</li>
		</ol>
		<c:url value="/a/usuario/${usuario.id}/altera" var="action" />
		<form:form id="formulario-cadastro" method="post" action="${action}">

			<spring:hasBindErrors htmlEscape="true" name="usuarioFormulario">
				<font color="red"> <c:forEach items="${errors.allErrors}"
						var="error">
						<spring:message text="${error.defaultMessage}" />
						<br />
					</c:forEach>
				</font>
			</spring:hasBindErrors>
			<c:if test="${not empty msgSucesso}">
				<div class="alert alert-success">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Sucesso!</strong> ${msgSucesso}
				</div>
			</c:if>
			<div class="form-group">
				<label for="nome">Nome</label> <input id="nome" class="form-control"
					name="nome" type="text" value="${usuario.nome}">
				<form:errors path="usuario.nome" cssClass="error" />
			</div>

			<div class="form-group">
				<label for="registro">Registro:</label> <input id="registro"
					class="form-control" name="registro" type="text"
					value="${usuario.registro}">
				<form:errors path="usuario.registro" cssClass="error" />
			</div>

			<div class="form-group">
				<label for="funcao">Função:</label> <select name="funcao"
					class="form-control funcao">
					<option value=""></option>
					<c:forEach items="${funcoes}" var="funcao">
						<option value="${funcao}"
							${usuario.funcao == funcao  ? "selected" : "" }>${funcao}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label for="funcao">Unidade:</label> <select name="unidade"
					class="form-control unidade">
					<option value=""></option>
					<c:forEach items="${unidades}" var="unidade">
						<option value="${unidade}"
							${usuario.unidade == unidade  ? "selected" : "" }>${unidade}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="telefone">Telefone:</label> <input
					class="form-control telefone" name="telefone" type="text"
					value="${usuario.telefone}">
			</div>

			<div class="form-group">
				<label for="celular">Celular:</label> <input
					class="form-control telefone" name="celular" type="text"
					value="${usuario.celular}">
			</div>


			<div class="form-group">
				<label for="email">E-mail</label> <input id="email"
					class="form-control" name="email" type="email"
					value="${usuario.email}">
				<form:errors path="usuario.email" cssClass="error" />
			</div>

			<div class="form-group text-right">
				<button type="submit" class="btn btn-primary">Salvar</button>
			</div>
		</form:form>
	</dti:usuario>
</dti:template>