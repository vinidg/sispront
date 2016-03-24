<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<dti:template title="SisSoPront | Inserir solicitação" cssFiles="form.css"
	jsFiles="solicitacao/MaskFormularios.js,acao.js" pagina="solicitações">
	<dti:solicitacao pagina="nova">
		<ol class="breadcrumb">
			<li><a href="<c:url value="/a/solicitacao/home"/>">Home</a></li>
			<li class="active">Nova solicitação</li>
		</ol>
		<c:url value="/a/solicitacao/nova" var="action" />
		<form:form method="post" action="${action}">

			<spring:hasBindErrors htmlEscape="true"
				name="solicitacaoFormulario">
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
			
			<div class="col-sm-6">
				<div class="form-group">
				<label for="nome">Nome do Paciente:</label> <input class="form-control"
					name="nome" type="text" value="${param['nome']}">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
				<label for="mae">Nome da Mãe:</label> <input class="form-control"
					name="mae" type="text" value="${param['mae']}">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
				<label for="trg">RG do Paciente:</label> <input class="form-control"
					name="rg" type="text" id="rg" value="${param['rg']}">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
				<label for="dataNascimento">Data de Nascimento:</label> <input class="form-control"
					name="dataNascimento" id="dataNascimento" type="text" value="${param['dataNascimento']}">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
				<label for="dataAtendimento">Data de Atendimento:</label> <input class="form-control"
					name="dataAtendimento" id="dataAtendimento" type="text" value="${param['dataAtendimento']}">
				</div>
			</div>
			
			<div class="col-sm-3">
			<div class="form-group">
					<label>Paciente foi internado ?</label><br /> <input
						name="internacao" id="internacaoTrue" type="radio" value="true"
						${param['internacao'] == 'true' ? "checked" : ""}>
					<label for="internacaoTrue" style="font-weight: normal;">Sim
					</label> <input name="internacao" id="internacaoFalse"
						type="radio" value="false"
						${param['internacao'] == 'false' ? "checked" : ""}>
					<label for="internacaoFalse" style="font-weight: normal;">Não
					</label>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group" id ="formShow" style="display: none">
				<label for="celular">Dias:</label> <input class="form-control"
					name="dias" id="dias" size="4px" maxlength="2" type="text" value="${param['dias']}">
				</div>
			</div>
			
			<div class="col-sm-12">
			<div class="form-group">
						<label for="motivo">Motivo da solicitação:</label>
						<textarea maxlength="4000" id="motivo" class="form-control"
							name="motivo" rows="4">${param['motivo']}</textarea>
					</div>
			</div>
			
			<div class="col-sm-6 hidden">
				<div class="form-group">
				<label for="horario">Horário da Ocorrência:</label> <input class="form-control"
					name="horario" type="text" id="horario" value="${param['horario']}">
				</div>
			</div>
			
			<div class="col-sm-6 hidden">
				<div class="form-group">
				<label for="local">Local  da Ocorrência:</label> <input class="form-control"
					name="local" type="text" id="local" value="${param['local']}">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
				<label for="telefone">Telefone:</label> <input class="form-control"
					name="telefone" type="text" id="telefone" value="${param['telefone']}">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
				<label for="celular">Celular:</label> <input class="form-control"
					name="celular" type="text" id="celular" value="${param['celular']}">
				</div>
			</div>
				
			<div class="col-sm-6">
				<div class="form-group">
				<label for="celular">Nome do Solicitante:</label> <input class="form-control"
					name="nomeSolicitante" type="text" value="${param['nomeSolicitante']}">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
				<label for="celular">Rg do Solicitante:</label> <input class="form-control"
					name="rgSolicitante" id="rgSolicitante" type="text" value="${param['rgSolicitante']}">
				</div>
			</div>
			
			<div class="col-sm-12">
			<div class="form-group">
			<label for="observacao">Observação:</label>
				<textarea maxlength="4000" id="observacao" class="form-control"
					name="observacao" rows="8">${param['observacao']}</textarea>
			</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="form-group text-right">
					<button class="btn btn-primary" type="submit">Salvar</button>
				</div>
			</div>
			
		</form:form>
		</dti:solicitacao>
</dti:template>
			