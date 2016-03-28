<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>
<dti:template title="SisSoPront | Todas Solicitações" cssFiles="form.css"
	jsFiles="solicitacao/filtro.js,solicitacao/mensagens.js,solicitacao/tooltip.js"
	refresh="true" pagina="todos">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>
	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"></div>
	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
		<c:if test="${not empty msgSucesso}">
			<div class="form-group">
				<div class="alert alert-success">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Sucesso!</strong> ${msgSucesso}
				</div>
			</div>
		</c:if>
	</div>
	<div class="col-md-12">
		<sec:authorize access="hasRole('ROLE_SOLICITANTE')">
			<dti:painelDeSolicitacoes
				solicitacoes="${novasSolicitacoes}"
				titulo="Solicitações novas"
				mensagemVazia="Não existem solicitações no momento"
				cor="panel-danger" divId="novasSolicitacoes"
				mostraStatus="false" />
		</sec:authorize>
	</div>
</dti:template>