<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>
<dti:template title="SisSoPront | Home" pagina="inicial">
	<div class="text-center">
		<h1>Bem vindo, ${nomeDoUsuario.nome} !</h1>
	</div>
</dti:template>