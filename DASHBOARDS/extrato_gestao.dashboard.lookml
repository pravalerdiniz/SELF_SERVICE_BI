- dashboard: repasse_extrato
  title: Repasse Extrato
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: bo64Uu90tQVXqvZ3Ah3o7O
  embed_style:
    show_filters_bar: false
  elements:
  - title: Repasse Extrato
    name: Repasse Extrato
    model: self_service_bi
    explore: repasse
    type: looker_grid
    fields: [repasse.cpf, repasse.nome_aluno, repasse.id_contrato, repasse.semestre_financiado,
      repasse.ies_grupo, repasse.nome_ies, repasse.campus_ies, repasse.nome_curso,
      repasse.tipo_aluno, repasse.vl_financiado_total, repasse.qtd_mensalidades, repasse.valor_mensalidade,
      repasse.vencimento_boleto_date, repasse.vl_pago_aluno, repasse.vl_comissao_pravaler,
      repasse.taxa_comissao, repasse.vl_desp_cobranca_pravaler, repasse.vl_juros_atraso,
      repasse.multa_atraso, repasse.vl_debito_total, repasse.vl_repasse_total_ies,
      repasse.reconhecimento_do_pagamento_date, repasse.dias_de_atraso, repasse.porcentagem_ipca,
      repasse.produto_nome, repasse.num_boleto, repasse.transferencia_date, repasse.tipo_baixa,
      repasse.concessao_date, repasse.parcela, repasse.vl_adm_aluno_ies, repasse.vl_adm_aluno_pravaler,
      sum_vl_ipca, valor_minimo_do_boleto]
    filters:
      repasse.transferencia_date: after 2018/01/01
    sorts: [repasse.cpf]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: SUM Vl IPCA,
        value_format: !!null '', value_format_name: !!null '', based_on: repasse.valor_ipca,
        _kind_hint: measure, measure: sum_vl_ipca, type: sum, _type_hint: number,
        id: gFeYzy6hxC}, {category: measure, expression: !!null '', label: Valor Mínimo
          do Boleto, value_format: !!null '', value_format_name: !!null '', based_on: repasse.valor_do_boleto,
        _kind_hint: measure, measure: valor_minimo_do_boleto, type: min, _type_hint: number,
        id: HrnwojGT3Q}]
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
    series_types: {}
    defaults_version: 1
    listen:
      Instituicao: repasse.id_ies
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
    explore: repasse
    listens_to_filters: []
    field: repasse.transferencia_date
  - name: Instituicao
    title: Instituicao
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: self_service_bi
    explore: repasse
    listens_to_filters: []
    field: repasse.id_ies
  embed_style:
    show_filters_bar: false
