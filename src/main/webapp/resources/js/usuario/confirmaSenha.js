$("#formulario-cadastro").submit(function() {
	var senha = $("#senha");
	var confirmacaoDeSenha = $("#confirmacao-senha");
	
	var usuarioInformouSenha = senha.val().length > 0;
	
	if (usuarioInformouSenha) {
		var senhasIguais = senha.val() == confirmacaoDeSenha.val();
		if (senhasIguais) {
			var erro = $("#erro-senha");
			if (erro) {
				erro.remove();
			}
		} else {
			var div = confirmacaoDeSenha.parent();
			div.append($("<span>", {
				id : "erro-senha",
				class : "error",
				text : "As senhas informadas não são iguais"
			})
			);
			return false;
		}
	}
});