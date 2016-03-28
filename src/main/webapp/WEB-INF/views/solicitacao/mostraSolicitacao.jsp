<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>

<dti:template title="SisATIH | Ficha de Solicitação"
	cssFiles="print.css" jsFiles="print.js" pagina="visualizacao">
<style type="text/css">
p {
	line-height:15%;
	} 
</style> 		
		<div class="print">
			<div class="text-center">
				<img src="<c:url value="/resources/images/so_logo_t.png" />"
					height="64px" width="52px"
					style="image-rendering: pixelated; opacity: 0.8; align: middle;" />
			</div>
			<br />
			<div class="text-center" style="font-size: 10px; color: #000000;">
				<p>Secretaria de Saúde</p>
				<p>SS.3 - Departamento de Atenção Hospitalar e de Urgência e Emergência</p>
				<p>SS.31 - Divisão de Atenção Pré Hospitalar</p>
				</div>
				<div class="text-center" style="font-size: 10px; color: #cccccc;">
				<p>Rua Luiz Ferreira da Silva nº 172/174 – 2º andar – Pq. São Diogo – SBC – CEP 09732-610  – Tel: 4336-7592 – e mail: </p>
				<p>divisão.prehospitalar@saobernardo.sp.gov.br</p>
			</div>
			<hr />
			<h4 class="text-center">
				SOLICITAÇÃO DE PRONTUÁRIO / RELATÓRIO MÉDICO
			</h4>
		</div>
		<div class="col-xs-6 col-sm-4 no-print">
		<legend>
			Dados da solicitação <small style="color: red;">Status: ${solicitacao.status}</small>
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
				<label>Nome do paciente</label>
					<div>${solicitacao.nome == null ? "-" : solicitacao.nome}</div>
				</div>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Unidade</label>
					<div>${solicitacao.unidade}</div>
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
				<label>Motivo da solicitação</label>
					<div>${solicitacao.motivo == null ? "-" : solicitacao.motivo}</div>
				</div>
				</div>
				<div class="col-xs-6 col-sm-4">
				<div class="form-group">
				<label>Data de nascimento do paciente</label>
				<div><c:if test="${empty solicitacao.dataNascimento}">-</c:if>
						<fmt:formatDate pattern="dd/MM/yyyy"
							value="${solicitacao.dataNascimento.time}" /></div>
				</div>
				<div class="form-group">
				<label>Data de atendimento do paciente</label>
				<div><c:if test="${empty solicitacao.dataAtendimento}">-</c:if>
						<fmt:formatDate pattern="dd/MM/yyyy"
							value="${solicitacao.dataAtendimento.time}" /></div>
				</div>
				</div>
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
				<c:if test="${solicitacao.unidade eq 'SAMU'}">
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
				<label>Internação do paciente</label>
					<div>${solicitacao.internacao eq true ? "Sim":"Não"}</div>
				</div>
				<c:if test="${solicitacao.internacao eq true}">
				<div class="form-group">
				<label>Número de dias internado(a)</label>
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
			</div>
			&nbsp;
			<div class="col-xs-12 col-sm-12 text-center print">
					<script type="text/javascript">
					monName = new Array ("janeiro", "fevereiro", "março", "abril", "maio", "junho", "agosto", "outubro", "novembro", "dezembro")
					now = new Date
					document.write("<p> São Bernardo do Campo, " + now.getDate() + " de " + monName [now.getMonth()] +  " de "  + now.getFullYear () + "</p>")
					</script>
			</div>
				
				<div class="col-xs-12 col-sm-12 print">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<hr size="50" width="80%" align="center">
				<p class="text-center">Assinatura do paciente ou responsável</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="print">
			<div class="text-center">
				<img src="<c:url value="/resources/images/so_logo_t.png" />"
					height="64px" width="52px"
					style="image-rendering: pixelated; opacity: 0.8; align: middle;" />
			</div>
			<br />
			<div class="text-center" style="font-size: 10px; color: #000000;">
				<p>Secretaria de Saúde</p>
				<p>SS.3 - Departamento de Atenção Hospitalar e de Urgência e Emergência</p>
				<p>SS.31 - Divisão de Atenção Pré Hospitalar</p>
				</div>
				<div class="text-center" style="font-size: 10px; color: #cccccc;">
				<p>Rua Luiz Ferreira da Silva nº 172/174 – 2º andar – Pq. São Diogo – SBC – CEP 09732-610  – Tel: 4336-7592 – e mail: </p>
				<p>divisão.prehospitalar@saobernardo.sp.gov.br</p>
				</div>
			</div>
				<hr />
			<h4 class="text-center">
				PROTOCOLO DE SOLICITAÇÃO DE PRONTUÁRIO/RELATÓRIO MÉDICO
			</h4>		
			<div class="col-xs-6 col-sm-4">
			<div class="form-group">
				<label>Data da Solicitação</label>
				<div><c:if test="${empty solicitacao.data}">-</c:if>
						<fmt:formatDate pattern="dd/MM/yyyy"
							value="${solicitacao.data.time}" /></div>
			</div>
			<div class="form-group">
				<label>Nome do paciente</label>
				<div>${solicitacao.nome == null ? "-" : solicitacao.nome}</div>
			</div>
			</div>
			<div class="col-xs-6 col-sm-4">
			<div class="form-group">
				<label>Data de atendimento</label>
				<div><c:if test="${empty solicitacao.dataAtendimento}">-</c:if>
						<fmt:formatDate pattern="dd/MM/yyyy"
							value="${solicitacao.dataAtendimento.time}" /></div>
			</div>
			<div class="form-group">
				<label>Unidade de atendimento</label>
				<div>${solicitacao.unidade == null ? "-" : solicitacao.unidade}</div>
			</div>
			</div>
			<div class="col-xs-6 col-sm-4">
			<div class="form-group">
			<label>Funcionário</label>
				<div>${solicitacao.autor.nome}</div>
			</div>
			<div class="form-group no-print">
			<label>Observação</label>
				<div>${solicitacao.observacao == null ? "-" : solicitacao.observacao}</div>
			</div>
			</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="col-xs-12 col-sm-12 print text-center">
			<h4 style="font-weight: bold;">Prazo: 20 a 30 dias úteis</h4>
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
