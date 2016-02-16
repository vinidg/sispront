/* Plugin DataTable - https://datatables.net */

$(document)
		.ready(
				function() {
					$('.table')
							.dataTable(
									{

										/*
										 * Essa configuração é do Reponsive do
										 * DataTable, ele juntamente com o
										 * Bootstrap faz com que em celulares,
										 * abra uma janela interna para
										 * visualizar a solicitacao inteira
										 */

										responsive : {
											details : {
												display : $.fn.dataTable.Responsive.display
														.modal({
															header : function(
																	row) {
																var data = row
																		.data();
																return 'Detalhes da solicitação: '
																		+ data[0];
															}
														}),
												renderer : function(api,
														rowIdx, columns) {
													var data = $
															.map(
																	columns,
																	function(
																			col,
																			i) {
																		return '<tr>'
																				+ '<td>'
																				+ col.title
																				+ ':'
																				+ '</td> '
																				+ '<td>'
																				+ col.data
																				+ '</td>'
																				+ '</tr>';
																	}).join('');

													return $(
															'<table class="table"/>')
															.append(data);
												}
											}
										},
										ordering : true,
										"order" : [ [ 6, "desc" ] ],
										columnDefs : [ {
											type : 'date-euro',
											targets : 6
										} ],
										/*
										 * Configuração do DataTable e
										 * configuração das mensagens padroes do
										 * plugin
										 */

										"lengthMenu" : [ 5, 10, 25, 50, 75, 100 ],
										"pagingType" : "full",
										"iDisplayLength" : 25,
										"language" : {
											"paginate" : {
												"first" : "Primeiro",
												"last" : "Último",
												"next" : "Próximo",
												"previous" : "Anterior",
											},
											"zeroRecords" : "Nenhuma solicitação encontrada",
											"lengthMenu" : "Mostrar _MENU_ por pagina",
											"sInfo" : "Mostrando de _START_ até _END_ de _TOTAL_ solicitações",
											"sInfoFiltered" : "(Filtrados de _MAX_ solicitações)",
											"sSearch" : "Pesquisar",
											"sLoadingRecords" : "Carregando...",
											"sProcessing" : "Processando...",
											"sInfoEmpty" : "Mostrando 0 até 0 de 0 solicitações"

										}, /*
											 * Pesquisa pelas colunas usando
											 * select
											 */
										initComplete : function() {
											this
													.api()
													.columns('.select-filter')
													.every(
															function() {
																var column = this;
																var select = $(
																		'<select style="max-width:40px;" class="form-control"><option value=""></option></select>')
																		.appendTo(
																				$(
																						column
																								.footer())
																						.empty())
																		.on(
																				'change',
																				function() {
																					var val = $.fn.dataTable.util
																							.escapeRegex($(
																									this)
																									.val());

																					column
																							.search(
																									val ? '^'
																											+ val
																											+ '$'
																											: '',
																									true,
																									false)
																							.draw();
																				});

																column
																		.data()
																		.unique()
																		.sort()
																		.each(
																				function(
																						d,
																						j) {
																					select
																							.append('<option value="'
																									+ d
																									+ '">'
																									+ d
																									+ '</option>')
																				});
															});
											// Input para pesquisar pelo nome do
											// paciente
											this
													.api()
													.columns('.input-filter')
													.every(
															function() {
																var that = this;
																var select = $(
																		'<input class="form-control" type="text" value=""></input>')
																		.appendTo(
																				that
																						.footer())
																		.on(
																				'keyup change',
																				function() {
																					var val = $.fn.dataTable.util
																							.escapeRegex($(
																									this)
																									.val());
																					that
																							.search(
																									val)
																							.draw();

																				});
															});
										}
									});
					/*
					 * Ocultar aqui o search do dataTabble pq é desnecessario,
					 * mas se desabilitar, não funcionara o filtro das colunas
					 */
					$('.dataTables_filter').hide();
				});// FIM READY

$('.dataTables_info').ready(
		function() {
			$('.dataTables_info').parent("div").removeAttr("class").addClass(
					"col-sm-12 text-right").next().removeAttr("class")
					.addClass("col-sm-12");
		});
