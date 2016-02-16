/* Plugin DataTable - https://datatables.net */

$(document).ready(
		function() {
			var table = $('.table').DataTable(
					{
						/*
						 * Nos tamanhos de celulares ou tablets o Responsive
						 * prioriza qual coluna ira aparecer primeiro
						 */
						
						columnDefs : [ 
						              
						              {
						            	  responsivePriority : 1, 
						            	  orderable: false,
						                  className: 'control',
						                  targets:   0
						              }, 
						              {responsivePriority : 2, targets : 5}, 
						], order: [ 1, 'asc' ], 
						/*
						 * Essa configuração é do Reponsive do DataTable, ele
						 * juntamente com o Bootstrap faz com que em celulares, 
						 * abra uma janela interna para visualizar a solicitacao
						 * inteira
						 */
						responsive : {
							details : {
								type: 'column', 

								display : $.fn.dataTable.Responsive.display
										.modal({
											header : function(row) {
												var data = row.data();
												return data[5];
											}
										}),
								renderer : function(api, rowIdx, columns) {
									var data = $.map(
											columns,
											function(col, i) {
												return '<tr>' + '<td>'
														+ col.title
														+ '</td> ' + '<td>'
														+ col.data + '</td>'
														+ '</tr>';
											}).join('');

									return $('<table class="table"/>').append(
											data);
								}
							}
						},
						/*
						 * Configuração do DataTable e configuração das
						 * mensagens padroes do plugin
						 */
						"paging" : false,
						"info" : false,
						"language" : {
							"zeroRecords" : "Nenhuma solicitação encontrada",
						}, /*Pesquisa pelas colunas usando select*/
						  initComplete: function () {
							  this.api().columns('.select-filter').every( function () {
					                var column = this;
					                var select = $('<select><option value=""></option></select>')
					                    .appendTo( $(column.footer()).empty() )
					                    .on( 'change', function () {
					                        var val = $.fn.dataTable.util.escapeRegex(
					                            $(this).val()
					                        );
					 
					                        column
					                            .search( val ? '^'+val+'$' : '', true, false )
					                            .draw();
					                    } );
					 
					                column.data().unique().sort().each( function ( d, j ) {
					                    select.append( '<option value="'+d+'">'+d+'</option>' )
					                } );
					            } );
							  //Input para pesquisar pelo nome do paciente
							  this.api().columns('.input-filter').every( function () {
								  var that = this;
								  var select = $('<input type="text" value=""></input>')
								  .appendTo(that.footer()).on( 'keyup change', function () {
									  var val = $.fn.dataTable.util.escapeRegex(
											  $(this).val()
									  );
									  that
									  .search( val )
									  .draw();
									  
								  } );
							  } );
						}
					});
			/*Ocultar aqui o search do dataTabble 
			pq é desnecessario, mas se desabilitar, 
			não funcionara o filtro das colunas*/
			$('.dataTables_filter').hide();
		});//FIM READY

