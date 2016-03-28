<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>

<dti:template title="SisATIH | Ficha de Solicitação"
	cssFiles="print.css" jsFiles="print.js" pagina="visualizacao">
		<div class="print">
			<div>
				<img src="<c:url value="/resources/images/so_logo_t.png" />"
					height="64px" width="52px"
					style="image-rendering: pixelated; opacity: 0.8;" /><span
					style="font-size: 16px; color: #6A6A6A; vertical-align: bottom;">
					SisSoPront - Sistema de Solicitação de Prontuários</span>
			</div>
			<hr />
			<h3>
				Detalhamento da Ficha:

				<fmt:formatNumber pattern="00000" value="${solicitacao.id}" />
				/${1900+solicitacao.data.time.year}
			</h3>
		</div>
		<div class="col-xs-6 col-sm-4">
		<legend>
			<small>Dados da solicitação</small>
		</legend>
		</div>
		<div class="col-xs-12 col-sm-12">
			<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Data de abertura</label>
					<div>
					<c:if test="${empty solicitacao.data}">-</c:if>
						<fmt:formatDate pattern="dd/MM/yyyy hh:mm:ss"
							value="${solicitacao.data.time}" />
					</div>
				</div>
				<div class="form-group">
				<label>Status</label>
					<div>${solicitacao.status}</div>
				</div>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Autor</label>
					<div>${solicitacao.autor.nome}</div>
				</div>
				<div class="form-group">
				<label>Unidade</label>
					<div>${solicitacao.unidade}</div>
						</div>
					</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Nome do paciente</label>
					<div>${solicitacao.nome == null ? "-" : solicitacao.nome}</div>
				</div>
				<div class="form-group">
				<label>Nome da mãe do paciente</label>
					<div>${solicitacao.mae == null ? "-" : solicitacao.mae}</div>
				</div>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>RG do paciente</label>
					<div>${solicitacao.rg == null ? "-" : solicitacao.rg}</div>
				</div>
				<div class="form-group">
				<label>Data de nascimento do paciente</label>
				<div><c:if test="${empty solicitacao.dataNascimento}">-</c:if>
						<fmt:formatDate pattern="dd/MM/yyyy"
							value="${solicitacao.dataNascimento.time}" /></div>
				</div>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Data de atendimento do paciente</label>
				<div><c:if test="${empty solicitacao.dataAtendimento}">-</c:if>
						<fmt:formatDate pattern="dd/MM/yyyy"
							value="${solicitacao.dataAtendimento.time}" /></div>
				</div>
				<div class="form-group">
				<label>Motivo da solicitação</label>
					<div>${solicitacao.motivo == null ? "-" : solicitacao.motivo}</div>
				</div>
				</div>
				<c:if test="${solicitacao.unidade eq 'DAHUE'}">
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Horario da ocorrência</label>
					<div>${solicitacao.horario == null ? "-" : solicitacao.horario}</div>
				</div>
				<div class="form-group">
				<label>Local da ocorrência</label>
					<div>${solicitacao.local == null ? "-" : solicitacao.local}</div>
				</div>
				</div>
				</c:if>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Telefone do paciente/solicitante</label>
					<div>${solicitacao.telefone == null ? "-" : solicitacao.telefone}</div>
				</div>
				<div class="form-group">
				<label>Celular do paciente/solicitante</label>
					<div>${solicitacao.celular == null ? "-" : solicitacao.celular}</div>
				</div>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Internação do paciente</label>
					<div>${solicitacao.internacao eq true ? "Sim":"Não"}</div>
				</div>
				<c:if test="${solicitacao.internacao eq true}">
				<div class="form-group">
				<label>Dias</label>
					<div>${solicitacao.dias == null ? "-" : solicitacao.dias}</div>
				</div>
				</c:if>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Nome do Solicitante</label>
					<div>${solicitacao.nomeSolicitante == null ? "-" : solicitacao.nomeSolicitante}</div>
				</div>
				<div class="form-group">
				<label>RG do Solicitante</label>
					<div>${solicitacao.rgSolicitante == null ? "-" : solicitacao.rgSolicitante}</div>
				</div>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Observação</label>
					<div>${solicitacao.observacao == null ? "-" : solicitacao.observacao}</div>
				</div>
				</div>
			</div>
		<div class="col-sm-12 text-center no-print">
			<div class="col-xs-12 col-sm-12" style="height: 30px;"></div>
			<button id="btn-imprimir" type="button" class="btn btn-primary"
				onclick="print();">
				<span class="glyphicon glyphicon-print"></span> Imprimir
			</button>
			<div class="col-xs-12 col-sm-12" style="height: 30px;"></div>
		</div>
</dti:template>