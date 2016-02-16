function verificarSenha() {
	senha = document.getElementById('senha').value
	senhanovamente = document.getElementById('senhanovamente').value
	if (senha != senhanovamente){
		alert("Confirme a sua senha novamente !");
		return false;
	}
	return true;
}

function confirmacao(id) {
	var r = confirm("Deseja remover esse usuário ?");
	if (r == true) {
		window.location.href = "/sisatih/usuario/remover?id=" + id;

	}
}

function resetSenha(id, re, nome, email) {
	var senhanova = "senha123";
	var r = confirm("Deseja resetar a senha do usuário ? Senha nova é: "
			+ senhanova);
	if (r == true) {
		window.location.href = "/sisatih/usuario/resetarsenha?id=" + id
				+ "&registro=" + re + "&nome=" + nome + "&email=" + email
				+ "&senha=" + senhanova;
	}
}

		