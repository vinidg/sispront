<%@ page pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<dti:template title="SisSoPront | Inserir solicitação" cssFiles="form.css"
	jsFiles="solicitacao/MaskFormularios.js,acao.js" pagina="nova">
	
	<ol class="breadcrumb">
			<li><a href="<c:url value="/a/solicitacao/todos"/>">Todas solicitacações</a></li>
			<li class="active">Alterar status</li>
		</ol>
	<c:url value="/a/solicitacao/${solicitacao.id}/status" var="action" />
		<form:form method="post" action="${action}">
		
		<div class="col-sm-6">
			<div class="form-group">
			<label>Status</label>
			<select name="resposta" class="form-control">
						<option value=""></option>
				<c:forEach items="${status}" var="status1">
					<option value="${status1}"
					${param['resposta'] == status1  ? "selected" : "" }>${status1}</option>
				</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="col-sm-6">
			<div class="form-group">
			<label>Motivo</label>
				<input class="form-control" name="motivo" type="text"
				value="${param['motivo']}">
			</div>
		</div>
		
		<div class="col-sm-6">
			<div class="form-group">
			<label>RG do retirante</label>
				<input class="form-control" name="rg" type="text"
				value="${param['rg']}">
			</div>
		</div>
		
		<div class="col-sm-12">
			<div class="form-group text-right">
				<button class="btn btn-primary" type="submit">Salvar</button>
			</div>
		</div>
			
		</form:form>
	</dti:template>