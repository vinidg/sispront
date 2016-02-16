$('#dataNascimento').mask("99/99/9999");
$('#dataAtendimento').mask("99/99/9999");
$('#rg').mask("99.999.999-9");
$('#rgSolicitante').mask("99.999.999-9");
$('#telefone').mask("(99) 9999-9999");
$('#celular').mask("(99) 9999-9999?9");

//uso em Dados Clinicos
$('#internacaoTrue').click(function(){
	if($(this).val() == "true"){
	
	$("#formShow").show(200);
	return
}
});
$('#internacaoFalse').click(function(){
	$('#formShow').hide(100);
	$('#dias').val('');
});