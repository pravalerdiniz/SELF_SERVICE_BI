- dashboard: relacao_de_cursos
  title: relacao_de_cursos
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - name: relacao_de_cursos
    title: Untitled Visualization
    model: self_service_bi
    explore: instituicao
    type: looker_grid
    fields: [instituicao.nome_fantasia, instituicao.nome_curso, instituicao.enfase,
      instituicao.ds_campus, instituicao.endereco_campus, instituicao.cidade_campus,
      instituicao.uf_campus, instituicao.periodo, instituicao.valor_mensalidade]
    filters:
      instituicao.campus_ativo: "Yes"
      instituicao.nome_fantasia: ''
      instituicao.ies_ativa: 'Yes'
      instituicao.curso_ativo: 'Yes'
      instituicao.cidade_campus: ''
      instituicao.uf_campus: ''
      instituicao.nome_curso: ''
    sorts: [instituicao.nome_fantasia]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
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
    series_types: {}
    defaults_version: 1
    embed_style:
      show_filters_bar: false
