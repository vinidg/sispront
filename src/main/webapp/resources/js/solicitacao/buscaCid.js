var codigoCid="";
$(document).ready(function() {
			var table = $('.table').DataTable({
				
				"lengthMenu": [5, 10, 25, 50, 75, 100 ], 
				"pagingType" : "simple", 
				"language" : {
					"zeroRecords" : "Nenhuma solicitação encontrada",
					"search" : "Pesquisar", 
					"lengthMenu": "Mostrar _MENU_ por pagina",
					"info": "Pagina _PAGE_ de _PAGES_",
					"infoFiltered": "(Total de _MAX_ CID's)", 
				},
				
			});
			
	
	$('.table tbody').on( 'click', 'tr', function () {
    	if ( $(this).hasClass('selected') ) {
    	$(this).removeClass('selected');
    	}
    	else {
        table.$('tr.selected').removeClass('selected');
        $(this).addClass('selected');
  	     codigoCid = $(this).closest('tr').find('td:first').html();
    }
	});
});
$('#principal').click(function(){
	$('#cid10-principal').val(codigoCid);
});

$('#secundario').click(function(){
	$('#cid10-secundario').val(codigoCid);
});

$('#secundario-dois').click(function(){
	$('#cid10-secundario-dois').val(codigoCid);
});


