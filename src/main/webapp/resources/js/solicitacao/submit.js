$("form").submit(function() {
	$("button[type=submit]").addClass("disabled");
	$("button[type=submit]").html('Enviando...');
});

function required(e) {
	if ($(e).val() == '') {
		var msg = "<span style='font-weight: normal;' class='error error-required'> Campo obrigatório.";
		$(e).parent().addClass("has-error").removeClass("has-success");
		$(e).prev().find(".error-required").remove();
		$(e).val('').prev().append(msg);
	} else {
		$(e).parent().removeClass("has-error");
		$(e).prev().find(".error-required").remove();
	}
}

$(document).ready(function() {
	$('.required').blur(function() {
		required($(this));
	});
});