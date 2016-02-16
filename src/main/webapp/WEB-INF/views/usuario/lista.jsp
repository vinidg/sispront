<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>

<dti:template title="SisATIH | Usuários"
	jsFiles="solicitacao/filtroUsuarios.js,solicitacao/mensagens.js"
	pagina="usuarios">
	<dti:usuario pagina="lista">
		<ol class="breadcrumb">
			<li><a href="<c:url value="/a/solicitacao/abertas"/>">Home</a></li>
			<li class="active">Usuários</li>
		</ol>

		<c:if test="${not empty msgSucesso}">
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Sucesso!</strong> ${msgSucesso}
			</div>
		</c:if>

		<c:if test="${not empty msgAviso}">
			<div class="alert alert-warning">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Aviso!</strong> ${msgAviso}
			</div>
		</c:if>

		<div class="form-group text-right">
			<c:url value="/a/usuario/novo" var="novoUsuario" />
			<a class="btn btn-primary" href="${novoUsuario}"><i
				class="glyphicon glyphicon-plus"></i>&nbsp;Novo Usuário</a>
		</div>

		<div class="table-responsive">
			<table class="table display compact"
				style="margin-bottom: 25px !important;">
				<thead>
					<tr>
						<th class="input-filter">Registro</th>
						<th class="input-filter">Nome</th>
						<th>E-mail</th>
						<th>Função</th>
						<th>Unidade</th>
						<th>Telefone</th>
						<th>Celular</th>
						<th>Ativado</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${usuarios}" var="usuario">
						<tr>
							<td>${usuario.registro}</td>
							<td>${usuario.nome}</td>
							<td>${usuario.email}</td>
							<td>${usuario.funcao}</td>
							<td>${usuario.unidade}</td>
							<td>${usuario.telefone == null ? '-' : usuario.telefone}</td>
							<td>${usuario.celular == null ? '-' : usuario.celular}</td>
							<td>${usuario.enabled==true? 'Sim' : 'Não'}</td>

							<td>
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="glyphicon glyphicon-cog"></i> Ação <span
											class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<li><a
											href="<c:url value="/a/usuario/${usuario.id}/altera"/>"><i
												class="glyphicon glyphicon-edit"></i>&nbsp; Dados Cadastrias</a></li>
										<li><a
											href="<c:url value="/a/usuario/${usuario.id}/altera-senha-adm"/>"><i
												class="glyphicon glyphicon-lock"></i>&nbsp;Alterar Senha</a></li>
										<li><a
											href="<c:url value="/a/usuario/${usuario.id}/papeis"/>"><i
												class="glyphicon glyphicon-duplicate"></i>&nbsp; Papéis</a></li>

										<c:if test="${usuario.enabled}">
											<li><a href="javascript:void(0);"
												onclick='$("#usuario-para-desativacao").val(${usuario.id})'
												data-toggle="modal"
												data-target=".modal-confirmacao-desativa-usuario"><i
													class="fa glyphicon glyphicon-ban-circle"></i>&nbsp;
													Desativar</a></li>
										</c:if>

										<c:if test="${!usuario.enabled}">
											<li><a href="javascript:void(0);"
												onclick='$("#usuario-para-ativacao").val(${usuario.id}); $("#form-ativa-usuario").submit();'><i
													class="fa glyphicon glyphicon-ok-circle"></i>&nbsp; Ativar</a></li>
										</c:if>

									</ul>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="modal fade modal-confirmacao-desativa-usuario"
			tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">Confirmação
							de exclusão</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-12">Deseja mesmo desativar esse usuário?
								Ele não poderá mais acessar o sistema.</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							onclick='$("#form-desativa-usuario").submit();'>Sim,
							desativar!</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<c:url value="/a/usuario/desativa" var="desativa" />
		<c:url value="/a/usuario/ativa" var="ativa" />
		<form:form method="post" action="${desativa}"
			id="form-desativa-usuario">
			<input type="hidden" id="usuario-para-desativacao" name="id" />
		</form:form>

		<c:url value="/a/usuario/ativa" var="ativa" />
		<form:form method="post" action="${ativa}" id="form-ativa-usuario">
			<input type="hidden" id="usuario-para-ativacao" name="id" />
		</form:form>

	</dti:usuario>
</dti:template>