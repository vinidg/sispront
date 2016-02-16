<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<dti:template title="SisATIH | Inserir usuário" cssFiles="form.css"
	jsFiles="solicitacao/MaskFormularios.js,acao.js" pagina="usuarios">
	<dti:usuario pagina="novo">
		<ol class="breadcrumb">
			<li><a href="<c:url value="/a/solicitacao/abertas"/>">Home</a></li>
			<li><a href="<c:url value="/a/usuario/todos"/>">Usuários</a></li>
			<li class="active">Novo Usuário</li>
		</ol>
		<c:url value="/a/usuario/novo" var="action" />
		<form:form method="post" action="${action}">

			<spring:hasBindErrors htmlEscape="true"
				name="usuarioFormularioCadastro">
				<div class="alert alert-danger" role="alert">
					<div class="formerror">
						<ul>
							<c:forEach var="error" items="${errors.allErrors}">
								<li>${error.defaultMessage}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</spring:hasBindErrors>

			<spring:hasBindErrors htmlEscape="true" name="senhaParaFormulario">
				<font color="red"> <c:forEach items="${errors.allErrors}"
						var="error">
						<spring:message text="${error.defaultMessage}" />
						<br />
					</c:forEach>
				</font>
			</spring:hasBindErrors>

			<div class="col-sm-6">
				<div class="form-group">
					<label for="unidade">Papéis:</label>
					<c:forEach items="${papeis}" var="papel" varStatus="i">
						<div>
							<label style="font-weight: normal;"> <input
								name="pedidoPapeis[${i.count - 1}].ativa" type="checkbox"
								${papel.ativa ? "checked" : ""}> <input
								name="pedidoPapeis[${i.count - 1}].papel.nome" type="hidden"
								value="${papel.papel.nome}" />${papel.papel.nome}
							</label>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-sm-12">
				<div class="form-group">
					<label for="nome">Nome:</label> <input class="form-control"
						name="nome" type="text" value="${param['nome']}">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="registro">Registro:</label> <input class="form-control"
						name="registro" type="text" value="${param['registro']}">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="funcao">Função:</label> <select name="funcao"
						class="form-control funcao">
						<option value=""></option>
						<c:forEach items="${funcoes}" var="funcao">
							<option value="${funcao}"
								${param['funcao'] == funcao  ? "selected" : "" }>${funcao}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
					<label for="unidade">Unidade:</label> <select name="unidade"
						class="form-control funcao">
						<option value=""></option>
						<c:forEach items="${unidades}" var="unidade">
							<option value="${unidade}"
								${param['unidade'] == unidade  ? "selected" : "" }>${unidade}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="form-group">
					<label for="telefone">Telefone:</label> <input
						class="form-control telefone" name="telefone" type="text"
						value="${param['telefone']}">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="celular">Celular:</label> <input
						class="form-control telefone" name="celular" type="text"
						value="${param['celular']}">
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label for="email">E-mail:</label> <input class="form-control"
						name="email" type="email" value="${param['email']}">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="senha">Senha:</label> <input id="senha"
						class="form-control" name="senha.senha" type="password">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="confirmacao-senha">Confirmação de senha:</label> <input
						id="confirmacao-senha" name="senha.senhaConfirmacao"
						class="form-control" type="password">
				</div>
			</div>

			<div class="col-sm-12">
				<div class="form-group text-right">
					<button class="btn btn-primary" type="submit">Salvar</button>
				</div>
			</div>

		</form:form>
	</dti:usuario>
</dti:template>