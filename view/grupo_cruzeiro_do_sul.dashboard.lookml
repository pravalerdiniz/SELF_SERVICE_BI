- dashboard: dados_grupo_cruzeiro_do_sul
  title: Dados Grupo Cruzeiro do Sul
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Propostas Iniciadas
    name: Propostas Iniciadas
    model: self_service_bi
    explore: jornada
    type: looker_column
    fields: [jornada.count_cpf, jornada.dt_status_date, proposta.aluno_cal_vet]
    pivots: [proposta.aluno_cal_vet]
    fill_fields: [jornada.dt_status_date]
    filters:
      jornada.etapa: Iniciado
      jornada.dt_status_date: this month
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.nm_produto: ''
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [jornada.dt_status_date, proposta.aluno_cal_vet]
    limit: 500
    row_total: right
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    series_colors:
      VETERANO - jornada.count_cpf: "#43525A"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 12
    col: 0
    width: 18
    height: 7
  - name: Propostas Iniciadas (2)
    type: text
    title_text: Propostas Iniciadas
    row: 10
    col: 0
    width: 24
    height: 2
  - name: Propostas Finalizadas
    type: text
    title_text: Propostas Finalizadas
    row: 19
    col: 0
    width: 24
    height: 2
  - title: Propostas Finalizadas
    name: Propostas Finalizadas (2)
    model: self_service_bi
    explore: jornada
    type: looker_column
    fields: [jornada.count_cpf, jornada.dt_status_date, proposta.aluno_cal_vet]
    pivots: [proposta.aluno_cal_vet]
    fill_fields: [jornada.dt_status_date]
    filters:
      jornada.etapa: Finalizado
      jornada.dt_status_date: this month
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.nm_produto: ''
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [jornada.dt_status_date, proposta.aluno_cal_vet]
    limit: 500
    row_total: right
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    series_colors:
      VETERANO - jornada.count_cpf: "#43525A"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 21
    col: 0
    width: 18
    height: 7
  - name: Tela da IES - Estoque
    type: text
    title_text: Tela da IES - Estoque
    row: 28
    col: 0
    width: 24
    height: 3
  - name: Aprovados IES
    type: text
    title_text: Aprovados IES
    row: 45
    col: 0
    width: 24
    height: 2
  - name: Contratos Gerados
    type: text
    title_text: Contratos Gerados
    row: 54
    col: 0
    width: 24
    height: 2
  - name: OK para Cessão
    type: text
    title_text: OK para Cessão
    row: 63
    col: 0
    width: 24
    height: 2
  - title: OK Cessão
    name: OK Cessão
    model: self_service_bi
    explore: jornada
    type: looker_column
    fields: [jornada.count_cpf, jornada.dt_status_date, proposta.nm_produto_comercial]
    pivots: [proposta.nm_produto_comercial]
    fill_fields: [jornada.dt_status_date]
    filters:
      jornada.etapa: Formalizado
      jornada.dt_status_date: this month
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [jornada.dt_status_date, proposta.nm_produto_comercial]
    limit: 500
    row_total: right
    dynamic_fields: [{dimension: modalidade_ajustada, label: Modalidade Ajustada,
        expression: 'if(${proposta.nm_modalidade_produto}="FIDC","ANTECIPAÇÃO",${proposta.nm_modalidade_produto})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    series_colors:
      25 EMERGENCIAL - jornada.count_cpf: "#f2102d"
      SEM JUROS - jornada.count_cpf: "#f15d22"
      SEM FIADOR - jornada.count_cpf: "#000000"
      33 - jornada.count_cpf: "#db49de"
      40 - jornada.count_cpf: "#7b087e"
      60 - jornada.count_cpf: "#00d397"
      EAD - jornada.count_cpf: "#ffbc00"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 65
    col: 0
    width: 16
    height: 7
  - title: Não Avaliados
    name: Não Avaliados
    model: self_service_bi
    explore: jornada
    type: looker_column
    fields: [jornada.count_cpf]
    filters:
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      jornada.ultimo_status_geral: '11'
      jornada.flg_proposta_atual: Sim
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.representante_atual: ''
    sorts: [jornada.count_cpf desc]
    limit: 500
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 31
    col: 0
    width: 3
    height: 7
  - title: Pendenciados
    name: Pendenciados
    model: self_service_bi
    explore: jornada
    type: looker_column
    fields: [jornada.count_cpf, jornada.descricao_detalhada_ultimo_status]
    filters:
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      jornada.ultimo_status_geral: '13,14'
      jornada.flg_proposta_atual: Sim
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
    sorts: [jornada.count_cpf desc]
    limit: 500
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 31
    col: 3
    width: 16
    height: 7
  - title: Total Tela IES
    name: Total Tela IES
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.count_cpf]
    filters:
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      jornada.ultimo_status_geral: '13,14,11'
      jornada.flg_proposta_atual: Sim
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
    sorts: [jornada.count_cpf desc]
    limit: 500
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 31
    col: 19
    width: 5
    height: 7
  - title: Reprovados e Pendenciados
    name: Reprovados e Pendenciados
    model: self_service_bi
    explore: proposta
    type: looker_column
    fields: [status.dt_status_date, status.status_destino_geral, status.cont_cpf]
    pivots: [status.status_destino_geral]
    fill_fields: [status.dt_status_date]
    filters:
      status.status_destino_geral: '39,13,14,15'
      status.dt_status_month: this month
      proposta.tipo_proposta: NOVO
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [status.dt_status_date desc, status.status_destino_geral]
    limit: 500
    row_total: right
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: 13 - status.count, id: 13
              - status.count, name: '13'}, {axisId: 14 - status.count, id: 14 - status.count,
            name: '14'}, {axisId: 31 - status.count, id: 31 - status.count, name: '31'},
          {axisId: 39 - status.count, id: 39 - status.count, name: '39'}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      31 - status.count: "#f15d22"
      13 - status.count: "#29006a"
      39 - status.count: "#43525A"
      39 - status.cont_cpf: "#ffbc00"
      13 - status.cont_cpf: "#00afd8"
      14 - status.cont_cpf: "#29006a"
      15 - status.cont_cpf: "#de0252"
    series_labels:
      39 - status.count: Reprovados
      31 - status.count: Aprovados
      13 - status.count: Pendenciados
      14 - status.count: Pendenciados
      13 - status.cont_cpf: Pendente de Matricula
      14 - status.cont_cpf: Pendente de Divida
      39 - status.cont_cpf: Reprovado
      15 - status.cont_cpf: Revertido p/ IES
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 38
    col: 0
    width: 16
    height: 7
  - title: Total Pendenciados
    name: Total Pendenciados
    model: self_service_bi
    explore: proposta
    type: single_value
    fields: [status.status_destino_geral, status.cont_cpf]
    pivots: [status.status_destino_geral]
    filters:
      status.status_destino_geral: '13,14,15'
      status.dt_status_month: this month
      proposta.tipo_proposta: NOVO
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [status.status_destino_geral]
    limit: 500
    row_total: right
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: 13 - status.count, id: 13
              - status.count, name: '13'}, {axisId: 14 - status.count, id: 14 - status.count,
            name: '14'}, {axisId: 31 - status.count, id: 31 - status.count, name: '31'},
          {axisId: 39 - status.count, id: 39 - status.count, name: '39'}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      31 - status.count: "#f15d22"
      13 - status.count: "#29006a"
      39 - status.count: "#43525A"
    series_labels:
      39 - status.count: Reprovados
      31 - status.count: Aprovados
      13 - status.count: Pendenciados
      14 - status.count: Pendenciados
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 38
    col: 20
    width: 4
    height: 7
  - title: Total Reprovados
    name: Total Reprovados
    model: self_service_bi
    explore: proposta
    type: single_value
    fields: [status.status_destino_geral, status.cont_cpf]
    pivots: [status.status_destino_geral]
    filters:
      status.status_destino_geral: '39'
      status.dt_status_month: this month
      proposta.tipo_proposta: NOVO
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [status.status_destino_geral]
    limit: 500
    row_total: right
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: 13 - status.count, id: 13
              - status.count, name: '13'}, {axisId: 14 - status.count, id: 14 - status.count,
            name: '14'}, {axisId: 31 - status.count, id: 31 - status.count, name: '31'},
          {axisId: 39 - status.count, id: 39 - status.count, name: '39'}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      31 - status.count: "#f15d22"
      13 - status.count: "#29006a"
      39 - status.count: "#43525A"
    series_labels:
      39 - status.count: Reprovados
      31 - status.count: Aprovados
      13 - status.count: Pendenciados
      14 - status.count: Pendenciados
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 38
    col: 16
    width: 4
    height: 7
  - title: Contratos Gerados
    name: Contratos Gerados (2)
    model: self_service_bi
    explore: status
    type: looker_column
    fields: [status.cont_cpf, status.dt_status_date]
    fill_fields: [status.dt_status_date]
    filters:
      status.tipo_proposta: NOVO
      status.dt_status_date: this month
      status.status_destino_geral: '40'
      status.flg_proposta_atual: 'Yes'
      status.status_origem_geral: '35,31,25'
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [status.dt_status_date desc]
    limit: 500
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: status.cont_cpf, id: status.cont_cpf,
            name: Quantidade de CPFs}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 56
    col: 0
    width: 20
    height: 7
  - title: Aprovados IES
    name: Aprovados IES (2)
    model: self_service_bi
    explore: status
    type: looker_column
    fields: [status.cont_cpf, status.dt_status_date]
    fill_fields: [status.dt_status_date]
    filters:
      status.tipo_proposta: NOVO
      status.dt_status_date: this month
      status.status_destino_geral: '25,31'
      status.flg_proposta_atual: 'Yes'
      status.status_origem_geral: '11,13,14'
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [status.dt_status_date desc]
    limit: 500
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: status.cont_cpf, id: status.cont_cpf,
            name: Quantidade de CPFs}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 47
    col: 0
    width: 20
    height: 7
  - title: Total Apr IES
    name: Total Apr IES
    model: self_service_bi
    explore: status
    type: single_value
    fields: [status.cont_cpf]
    filters:
      status.tipo_proposta: NOVO
      status.dt_status_date: this month
      status.status_destino_geral: '25,31'
      status.flg_proposta_atual: 'Yes'
      status.status_origem_geral: '11,13,14'
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    limit: 500
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 47
    col: 20
    width: 4
    height: 7
  - title: Total Contratos Gerados
    name: Total Contratos Gerados
    model: self_service_bi
    explore: status
    type: single_value
    fields: [status.cont_cpf]
    filters:
      status.tipo_proposta: NOVO
      status.dt_status_date: this month
      status.status_destino_geral: '40'
      status.flg_proposta_atual: 'Yes'
      status.status_origem_geral: '35,31,25'
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    limit: 500
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 56
    col: 20
    width: 4
    height: 7
  - title: Total OK Cessão
    name: Total OK Cessão
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.count_cpf]
    filters:
      jornada.etapa: Formalizado
      jornada.dt_status_date: this month
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    limit: 500
    row_total: right
    dynamic_fields: [{dimension: modalidade_ajustada, label: Modalidade Ajustada,
        expression: 'if(${proposta.nm_modalidade_produto}="FIDC","ANTECIPAÇÃO",${proposta.nm_modalidade_produto})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 65
    col: 21
    width: 3
    height: 7
  - title: OK Cessão Por Modalidade
    name: OK Cessão Por Modalidade
    model: self_service_bi
    explore: jornada
    type: looker_pie
    fields: [jornada.count_cpf, modalidade_ajustada]
    filters:
      jornada.etapa: Formalizado
      jornada.dt_status_date: this month
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      modalidade_ajustada: "-NULL"
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    sorts: [jornada.count_cpf desc]
    limit: 500
    dynamic_fields: [{dimension: modalidade_ajustada, label: Modalidade Ajustada,
        expression: 'if(${proposta.nm_modalidade_produto}="FIDC","ANTECIPAÇÃO",${proposta.nm_modalidade_produto})',
        value_format: !!null '', value_format_name: percent_0, _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: America/Sao_Paulo
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    start_angle:
    series_colors:
      ANTECIPAÇÃO: "#f15d22"
      GESTAO: "#43525A"
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Data
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    hidden_points_if_no: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 65
    col: 16
    width: 5
    height: 7
  - name: Cedidos
    type: text
    title_text: Cedidos
    row: 72
    col: 0
    width: 24
    height: 3
  - title: Cedidos
    name: Cedidos (2)
    model: self_service_bi
    explore: jornada
    type: looker_line
    fields: [jornada.dt_status_month_name, jornada.count_cpf, jornada.dt_status_year]
    pivots: [jornada.dt_status_year]
    fill_fields: [jornada.dt_status_year, jornada.dt_status_month_name]
    filters:
      jornada.etapa: Cedido
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      jornada.dt_status_year: 3 years
      proposta.nm_produto: ''
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.tipo_produto: ''
      proposta.id_produto: "-BOF-47"
      proposta.regional_atual: ''
      proposta.aluno_cal_vet: ''
      proposta.canal_acesso_descoberta: ''
      proposta.ds_como_soube: ''
      proposta.periodo_curso: ''
    sorts: [jornada.dt_status_year desc 0, jornada.dt_status_month_name]
    limit: 500
    column_limit: 50
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    defaults_version: 1
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 75
    col: 0
    width: 24
    height: 9
  - title: Veterano
    name: Veterano
    model: self_service_bi
    explore: jornada
    type: looker_funnel
    fields: [jornada.etapa, jornada.ordem_etapa, jornada.count_cpf]
    filters:
      jornada.etapa: Iniciado,Finalizado,Aprovado Risco,Aprovado Instituicao,Contrato
        Gerado,Formalizado
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.id_produto: "-BOF-47"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
      proposta.aluno_cal_vet: VETERANO
      proposta.canal_acesso_descoberta: ''
      proposta.ds_como_soube: ''
      proposta.periodo_curso: ''
    sorts: [jornada.ordem_etapa]
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Sao_Paulo
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: prior
    percentPosition: right
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: pravaler
      custom:
        id: 915d51d9-4d61-cd01-66c4-9b7562642e93
        label: Custom
        type: continuous
        stops:
        - color: "#575757"
          offset: 0
        - color: "#575757"
          offset: 50
        - color: "#575757"
          offset: 100
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [jornada.ordem_etapa]
    hidden_points_if_no: []
    series_labels: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    column_order: ["$$$_row_numbers_$$$", Iniciado_jornada.count_cpf, Finalizado_jornada.count_cpf,
      Aprovado Risco_jornada.count_cpf, Aprovado Instituicao_jornada.count_cpf, Contrato
        Gerado_jornada.count_cpf, Formalizado_jornada.count_cpf, !!null '']
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
      Período Funil: jornada.dt_status_date
    row: 0
    col: 14
    width: 10
    height: 10
  - title: Calouro
    name: Calouro
    model: self_service_bi
    explore: jornada
    type: looker_funnel
    fields: [jornada.etapa, jornada.ordem_etapa, jornada.count_cpf]
    filters:
      jornada.etapa: Iniciado,Finalizado,Aprovado Risco,Aprovado Instituicao,Contrato
        Gerado,Formalizado
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.id_produto: "-BOF-47"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
      proposta.canal_acesso_descoberta: ''
      proposta.ds_como_soube: ''
      proposta.periodo_curso: ''
      proposta.aluno_cal_vet: CALOURO
    sorts: [jornada.ordem_etapa]
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Sao_Paulo
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: prior
    percentPosition: right
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: pravaler
      custom:
        id: 126c024e-9d38-649a-03f6-b519aed2a260
        label: Custom
        type: continuous
        stops:
        - color: "#ff731f"
          offset: 0
        - color: "#ff731f"
          offset: 50
        - color: "#ff731f"
          offset: 100
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [jornada.ordem_etapa]
    hidden_points_if_no: []
    series_labels: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    column_order: ["$$$_row_numbers_$$$", Iniciado_jornada.count_cpf, Finalizado_jornada.count_cpf,
      Aprovado Risco_jornada.count_cpf, Aprovado Instituicao_jornada.count_cpf, Contrato
        Gerado_jornada.count_cpf, Formalizado_jornada.count_cpf, !!null '']
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
      Período Funil: jornada.dt_status_date
    row: 0
    col: 0
    width: 10
    height: 10
  - title: Total Propostas Iniciadas
    name: Total Propostas Iniciadas
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.count_cpf]
    filters:
      jornada.etapa: Iniciado
      jornada.dt_status_date: this month
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.nm_produto: ''
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    limit: 500
    row_total: right
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    series_colors:
      VETERANO - jornada.count_cpf: "#43525A"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 12
    col: 18
    width: 6
    height: 7
  - title: Total Propostas Finalizadas
    name: Total Propostas Finalizadas
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.count_cpf]
    filters:
      jornada.etapa: Finalizado
      jornada.dt_status_date: this month
      jornada.status_etapa: '1'
      jornada.tipo_proposta: NOVO
      proposta.nm_produto: ''
      proposta.tipo_produto: "-FIES"
      proposta.nm_produto_comercial: "-COMPRA DE CARTEIRA"
      proposta.regional_atual: ''
      status.flg_status_performance: 'Yes'
    limit: 500
    row_total: right
    query_timezone: America/Sao_Paulo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Quantidade de Aluno, orientation: left, series: [{axisId: jornada.count_cpf,
            id: jornada.count_cpf, name: Count Cpf}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Data
    series_types: {}
    series_colors:
      VETERANO - jornada.count_cpf: "#43525A"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Grupo IES: proposta.grupo_instituicao
      IES: proposta.ds_instituicao
    row: 21
    col: 18
    width: 6
    height: 7
  filters:
  - name: Grupo IES
    title: Grupo IES
    type: field_filter
    default_value: GRUPO CRUZEIRO DO SUL,POSITIVO
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: self_service_bi
    explore: proposta
    listens_to_filters: [Grupo IES]
    field: proposta.grupo_instituicao
    options:
  - GRUPO CRUZEIRO DO SUL
  - POSITIVO
  - name: IES
    title: IES
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: self_service_bi
    explore: proposta
    listens_to_filters: [Grupo IES, Regional, IES]
    field: proposta.ds_instituicao
  - name: Período Funil
    title: Período Funil
    type: field_filter
    default_value: 2020/09/01 to 2020/11/24
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: self_service_bi
    explore: jornada
    listens_to_filters: [Grupo IES]
    field: jornada.dt_status_date
