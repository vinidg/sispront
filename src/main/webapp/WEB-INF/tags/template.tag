<%@ tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ attribute name="title" required="true"%>
<%@ attribute name="cssFiles" required="false"%>
<%@ attribute name="jsFiles" required="false"%>
<%@ attribute name="refresh" required="false"%>
<%@ attribute name="pagina" required="false"%>


<jsp:useBean id='usuarioLogado'
	class='br.gov.sp.saobernardo.sispront.usuario.UsuarioAdaptador'
	scope='page' />

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:if test="${refresh == true }">
	<meta http-equiv="refresh" content="60" />
</c:if>

<title>${title}</title>

<!-- Default styles -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/dataTables.bootstrap.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/dataTables-row-selector.bootstrap.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/responsive.bootstrap.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/custom-fixes.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/custom-cores.css"/>">

<c:forEach items="${cssFiles}" var="file">
	<c:url var="url" value="/resources/css/${file}" />
	<link rel="stylesheet" href="${url}">
</c:forEach>
</head>
<body>
	<div class="container-fluid">
		<!-- Menu -->
		<div class="row">
			<div class="col-sm-12">
				<nav class="navbar navbar-default navbar-fixed-top no-print"
					style="">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#main-menu">
							<span class="icon-bar"></span> 
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand"><label><img
								style="height: 55px; margin-top: -17px;" alt=""
								src="<c:url value="/resources/images/so_logo_t_.png" />"></label><label
							style="font-weight: normal; vertical-align: top;">SisSoPront</label></a>
					</div>
					<div class="collapse navbar-collapse" id="main-menu">
						<ul class="nav navbar-nav">
								<sec:authorize
								access="hasRole('ROLE_LOGADO')">
								<li class="${pagina == 'inicial' ? 'active' : '' }"><a
									href="<c:url value="/a/solicitacao/home"/>">Página
										inicial</a></li>
								</sec:authorize>
								<sec:authorize
								access="hasRole('ROLE_LOGADO') or hasRole('ROLE_SOLICITANTE')">
								<li class="${pagina == 'nova' ? 'active' : '' }"><a
									href="<c:url value="/a/solicitacao/nova"/>">Nova solicitação</a></li>
							</sec:authorize>
							<sec:authorize
								access="hasRole('ROLE_SOLICITANTE') or hasRole('ROLE_MONITOR')">
								<li class="${pagina == 'todos' ? 'active' : '' }"><a
									href="<c:url value="/a/solicitacao/todos"/>">Todas solicitações</a></li>
							</sec:authorize>
							<sec:authorize
								access="hasRole('ROLE_ADMINISTRADOR')">
								<li
									class="dropdown ${(pagina == 'unidades' || pagina == 'medicos' || pagina == 'usuarios') ? 'active' : '' }"><a
									href="#" class="dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">Tabelas<span
										class="caret"></span></a>
									<ul class="dropdown-menu">
										<sec:authorize access="hasRole('ROLE_ADMINISTRADOR')">
											<li class="${pagina == 'usuarios' ? 'active' : '' }"><a
												href="<c:url value="/a/usuario/todos"/>"><i
													class="glyphicon glyphicon-user"></i>&nbsp; Usuários</a></li>
										</sec:authorize>
									</ul></li>
							</sec:authorize>

						</ul>
						<sec:authorize access="hasRole('ROLE_LOGADO')">
							<sec:authentication var="user" property="principal.nome" />
							<c:url value="/a/log-out" var="logOutUrl" />
							<c:url value="/a/usuario/altera-senha" var="alterarSenha" />
							<ul class="nav navbar-nav navbar-right"
								style="margin-right: 10px;">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><i class="glyphicon glyphicon-user"
										aria-hidden="true"></i> <label class="nome-usuario"
										style="font-weight: normal;">${user}</label><span
										class="caret"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header icon-usuario"><span
											style="color: white;">${user}</span></li>
										<li role="separator" class="divider icon-usuario"></li>
										<li><a href="${alterarSenha}"><i
												class="glyphicon glyphicon-cog"></i>&nbsp; Alterar senha</a></li>
										<li role="separator" class="divider nome-usuario"></li>
										<li><a href="${logOutUrl}"
											onclick="document.getElementById('logout').submit();"><i
												class="glyphicon glyphicon-off"></i>&nbsp; Sair</a></li>
									</ul></li>
							</ul>
						</sec:authorize>
					</div>
				</nav>
			</div>
		</div>

		<div class="row">
			<jsp:doBody />
		</div>

		<nav
			class="navbar navbar-default navbar-fixed-bottom hidden-xs no-print foot">
			<p class="navbar-text">Município de São Bernardo do Campo |
				Departamento de Atenção Hospitalar de Urgência e Emergência - 2016</p>
		</nav>
	</div>
	<!-- Default scripts -->
	<script src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.dataTables.js"/>"></script>
	<script src="<c:url value="/resources/js/dataTables.responsive.js"/>"></script>
	<script src="<c:url value="/resources/js/dataTables.bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/responsive.bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/dataTables.sorting.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.maskedinput.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.numeric.min.js"/>"></script>
	<script src="<c:url value="/resources/js/solicitacao/submit.js"/>"></script>

	<c:forEach items="${jsFiles}" var="file">
		<c:url var="url" value="/resources/js/${file}" />
		<script src="${url}"></script>
	</c:forEach>
</body>
</html>