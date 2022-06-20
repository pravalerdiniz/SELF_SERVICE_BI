- dashboard: repasse_extrato
  title: Repasse Extrato
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: YbliXIkoiAM99yeHGnSqpI
  elements:
  - title: Repasse Extrato
    name: Repasse Extrato
    model: self_service_bi
    explore: financeiro
    type: looker_grid
    fields: [proposta.cpf_aluno, proposta.aluno_nome, financeiro.id_contrato, proposta.semestre_financiado,
      proposta.flg_contrato_ativo, instituicao.grupo, proposta.ds_instituicao, proposta.ds_campus,
      proposta.ds_curso, proposta.tipo_proposta, proposta.vl_financiamento, proposta.qtd_men_corrente,
      proposta.vl_mensalidade, financeiro.data_vencimento_date, financeiro.vl_total,
      vw_extrato_repasse.vl_comissao_pravaler, vw_extrato_repasse.vl_debito_total,
      vw_extrato_repasse.vl_repasse_total_ies, financeiro.data_pagamento_date, financeiro.dias_atraso,
      financeiro.perc_ipca, proposta.nm_produto, vw_extrato_repasse.num_boleto, financeiro_extrato_titulo.transferencia_date,
      instituicao.nome_fantasia, financeiro.ds_baixa, proposta.data_concessao_date,
      financeiro.num_parcela, financeiro.vl_atraso, financeiro.sum_vl_ipca, financeiro.sum_juros,
      financeiro.sum_despesa, financeiro.sum_vl_seguro]
    filters:
      proposta.ds_instituicao: FEEVALE
      instituicao.grupo: ''
      vw_extrato_repasse.num_boleto: NOT NULL
    sorts: [financeiro.data_vencimento_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Transferencia Date: financeiro_extrato_titulo.transferencia_date
      ID Instituição: proposta.id_instituicao
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Transferencia Date
    title: Transferencia Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: self_service_bi
    explore: financeiro
    listens_to_filters: []
    field: financeiro_extrato_titulo.transferencia_date
  - name: ID Instituição
    title: ID Instituição
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: self_service_bi
    explore: financeiro
    listens_to_filters: []
    field: proposta.id_instituicao
  embed_style:
    show_filters_bar: false
