<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>

<dti:template title="SisPront | Login" cssFiles="form.css">
	<div class="row">
		<div class="text-center">
			<img src="<c:url value="/resources/images/so_logo_t.png" />" height="120px" width="95px"
				style="image-rendering: pixelated; opacity: 0.8;" />
			<h3 style="color: #6A6A6A;">
				SisSoPront - Sistema de Solicitação de Prontuários
				</h3>
			<hr />
		</div>
		<div class="col-xs-12 col-md-4 col-md-offset-4">
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<font color="red"> Usuário não encontrado, verificar RE e
					senha <br /> <br />
				</font>
			</c:if>
			<div class="panel panel-default ">
				<div class="panel-heading">
					<h2 class="panel-title">Login</h2>
				</div>
				<div class="panel-body">
					<div class="account-wall">
						<c:url value="/log-in" var="action" />
						<form:form action="${action}" method="post">
							<div class="form-group">
								<label for="registro">Registro:</label> <input id="registro"
									class="form-control" name="registro" type="text">
							</div>
							<div class="form-group">
								<label for="senha">Senha:</label> <input id="senha"
									class="form-control" name="senha" type="password">
							</div>
							<div align="center">
								<button type=submit id="btnAcessar" class="btn btn-primary">
									<span class="glyphicon glyphicon-user"></span> Acessar
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

</dti:template>