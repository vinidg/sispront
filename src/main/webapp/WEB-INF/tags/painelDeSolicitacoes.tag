<%@ tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ attribute name="solicitacoes" required="true"
	type="java.lang.Iterable"%>
<%@ attribute name="titulo" required="true"%>
<%@ attribute name="divId" required="true"%>
<%@ attribute name="mensagemVazia" required="true"%>
<%@ attribute name="cor" required="true"%>
<%@ attribute name="registrosPorPagina" required="false"%>
<%@ attribute name="mostraStatus" required="true"%>
<div class="panel ${cor}">
	<div class="panel-heading">
		<h4 class="panel-title">${titulo}${(solicitacoes != null && not empty solicitacoes) ? ' ('.concat(fn:length(solicitacoes)).concat(')') : ' (0)'}
			<small role="button" style="float: right;" data-toggle="collapse"
				data-target="#${divId}"
				onclick="$(this).find('.glyphicon').toggle();"> <i
				class="glyphicon glyphicon-minus"></i><i
				class="glyphicon glyphicon-plus" style="display: none;"></i>
			</small>
		</h4>
	</div>
	<br />
	<div id="${divId}" class="collapse in">
		<c:choose>
			<c:when test="${not empty solicitacoes}">
				<div
					class="table-responsive container-fluid registros-por-pagina-${registrosPorPagina}">
					<table class="table table-condensed compact responsive">
						<thead>
							<tr>
								<th class="input-filter">Paciente</th>
								<th class="select-filter">Nome da mãe</th>
								<th class="select-filter">RG</th>
								<th>Data Nascimento</th>
								<th>Data de Atendimento</th>
								<th>Motivo</th>
								<th>Internação</th>
								<th>Dias</th>
								<th>Status</th>
								<th>Data solicitação</th>
								<th>Telefone</th>
								<th>Celular</th>
								<th>Solicitante</th>
								<th>RG solicitante</th>
								<th>Observação</th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Paciente</th>
								<th>Nome da mãe</th>
								<th>RG</th>
								<th>Data Nascimento</th>
								<th>Data de Atendimento</th>
								<th>Motivo</th>
								<th>Internação</th>
								<th>Dias</th>
								<th>Status</th>
								<th>Autor</th>
								<th>Data solicitação</th>
								<th>Telefone</th>
								<th>Celular</th>
								<th>Solicitante</th>
								<th>RG solicitante</th>
								<th>Observação</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${solicitacoes}" var="solicitacao">
								<tr>
									<td style="vertical-align: middle;">${solicitacao.nome}</td>
									<td style="vertical-align: middle;">${solicitacao.mae}</td>
									<td style="vertical-align: middle;">${solicitacao.rg}</td>
									<td style="vertical-align: middle;"><fmt:formatDate
											pattern="dd/MM/yyyy"
											value="${solicitacao.dataNascimento}" /></td>
									<td style="vertical-align: middle;"><fmt:formatDate
											pattern="dd/MM/yyyy"
											value="${solicitacao.dataAtendimento}" /></td>
									<td style="vertical-align: middle;">${solicitacao.motivo}</td>
									<td style="vertical-align: middle;">${solicitacao.interncao}</td>
									<td style="vertical-align: middle;">${solicitacao.dias}</td>
									<td style="vertical-align: middle;">${solicitacao.status}</td>
									<td style="vertical-align: middle;">${solicitacao.autor.nome}</td>
									<td style="vertical-align: middle;">${solicitacao.data}</td>
									<td style="vertical-align: middle;">${solicitacao.telefone}</td>
									<td style="vertical-align: middle;">${solicitacao.celular}</td>
									<td style="vertical-align: middle;">${solicitacao.nomeSolicitante}</td>
									<td style="vertical-align: middle;">${solicitacao.rgSolicitante}</td>
									<td style="vertical-align: middle;">${solicitacao.observacao}</td>
									
									
									<td style="vertical-align: middle;"><c:url
											value="/a/solicitacao/${solicitacao.id}" var="visualizar" />
										<sec:authorize
											access="!hasRole('ROLE_SOLICITANTE') and !hasRole('ROLE_REGULADOR')">
											<a class="btn btn-default" href="${visualizar}"><i
												class="glyphicon glyphicon-zoom-in"></i>&nbsp; Visualizar</a>
										</sec:authorize> <sec:authorize
											access="hasRole('ROLE_SOLICITANTE') or hasRole('ROLE_REGULADOR')">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-default dropdown-toggle"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<i class="glyphicon glyphicon-cog"></i> Ação <span
														class="caret"></span>
												</button>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="${visualizar}"><i
															class="glyphicon glyphicon-zoom-in"></i>&nbsp; Visualizar</a></li>
													<c:if test="${solicitacao.permitidoAlteracaoDadosPessoais}">
														<li><a
															href="<c:url value="/a/solicitacao/${solicitacao.id}/edita-dados-pessoais"/>"><i
																class="glyphicon glyphicon-edit"></i>&nbsp;Atualizar
																dados pessoais</a></li>
													</c:if>
												</ul>
											</div>
										</sec:authorize></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<div class="panel-body">${mensagemVazia}</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>