<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="dti"%>

<dti:template title="SisATIH | Ficha de Solicitação"
	cssFiles="print.css" jsFiles="print.js" pagina="visualizacao">
<dti:solicitacao>
		<div class="print">
			<div>
				<img src="<c:url value="/resources/images/so_logo_t.png" />"
					height="64px" width="52px"
					style="image-rendering: pixelated; opacity: 0.8;" /><span
					style="font-size: 16px; color: #6A6A6A; vertical-align: bottom;">
					SisSoPront - Sistema de Solicitação de Prontuários</span>
			</div>
			<hr />
			<h4>
				Detalhamento da Ficha:

				<fmt:formatNumber pattern="00000" value="${solicitacao.id}" />
				/${1900+solicitacao.data.time.year}
			</h4>
		</div>
		
		<legend>
			<small> Identificação</small>
		</legend>
	
</dti:solicitacao>
</dti:template>