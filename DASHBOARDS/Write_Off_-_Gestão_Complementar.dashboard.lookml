- dashboard: write_off__gestocomplementar
  title: Write Off - Gestão/Complementar
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Tabela WO
    name: Tabela WO
    model: self_service_bi
    explore: financeiro
    type: looker_grid
    fields: [proposta.cpf_aluno, proposta.id_contrato, proposta.aluno_nome, proposta.grupo_instituicao,
      proposta.ds_instituicao, proposta.ds_campus, proposta.tipo_proposta, proposta.semestre_financiado,
      proposta.nm_produto, financeiro.data_writeoff_date, financeiro.ds_titulo_status,
      proposta.vl_mensalidade, proposta.nm_modalidade_produto, financeiro.sum_boleto,
      financeiro.count_titulo]
    filters:
      financeiro.id_fundo_investimento: '6'
      financeiro.ds_titulo_status: WRITE OFF - PRAVALER MENSAL
      financeiro.data_writeoff_date: after 2020/01/01
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.flg_wo_ies: 'Yes'
    sorts: [financeiro.data_writeoff_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      proposta.cpf_aluno: CPF
      proposta.id_contrato: Contrato
      proposta.aluno_nome: Nome do Aluno
      proposta.grupo_instituicao: Grupo IE
      proposta.ds_instituicao: Instituição
      proposta.ds_campus: Campus
      proposta.tipo_proposta: Tipo de Proposta
      proposta.semestre_financiado: Semestre Fin.
      proposta.nm_produto: Produto
      financeiro.data_writeoff_date: Data W.O.
      financeiro.ds_titulo_status: Status
      proposta.vl_mensalidade: Valor Mensalidade
      proposta.nm_modalidade_produto: Modalidade
      financeiro.sum_boleto: Valor Boletos
      financeiro.count_titulo: Qtde. Boletos
    series_cell_visualizations:
      financeiro.sum_boleto:
        is_active: false
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      ID Instituicao: proposta.id_instituicao
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: ID Instituicao
    title: ID Instituicao
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
    field: proposta.id_instituicao
  embed_style:
    show_filters_bar: false
