- dashboard: onepage_ie__alunos_renovao
  title: OnePage IE - Alunos Renovação
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - name: Tela da IE
    type: text
    title_text: Tela da IE
    subtitle_text: Alunos de renovação parados na tela de avaliação da IE por status
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Não avaliados
    name: Não avaliados
    model: self_service_bi
    explore: alunos
    type: single_value
    fields: [alunos.count_id_cpf]
    filters:
      alunos.id_status_geral: '2011'
      alunos.ultimo_status_proposta: ''
      proposta.tipo_proposta: RENOVACAO
      alunos.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#00d397",
        font_color: "#000000", color_application: {collection_id: pravaler, palette_id: pravaler-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 51, background_color: "#FFbc00", font_color: "#000000", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 50, background_color: "#dc2525", font_color: "#FFFFFF", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 2
    col: 0
    width: 8
    height: 2
  - title: Revertidos nova avaliação
    name: Revertidos nova avaliação
    model: self_service_bi
    explore: alunos
    type: single_value
    fields: [alunos.count_id_cpf]
    filters:
      alunos.id_status_geral: '2015'
      alunos.ultimo_status_proposta: ''
      proposta.tipo_proposta: RENOVACAO
      alunos.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#00d397",
        font_color: "#000000", color_application: {collection_id: pravaler, palette_id: pravaler-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 51, background_color: "#FFbc00", font_color: "#000000", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 50, background_color: "#dc2525", font_color: "#FFFFFF", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Pendentes por dívida
    name: Pendentes por dívida
    model: self_service_bi
    explore: alunos
    type: single_value
    fields: [alunos.count_id_cpf]
    filters:
      alunos.id_status_geral: '2014'
      alunos.ultimo_status_proposta: ''
      proposta.tipo_proposta: RENOVACAO
      alunos.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#00d397",
        font_color: "#000000", color_application: {collection_id: pravaler, palette_id: pravaler-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 51, background_color: "#FFbc00", font_color: "#000000", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 50, background_color: "#dc2525", font_color: "#FFFFFF", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 2
    col: 16
    width: 8
    height: 2
  - title: Pendentes de matrícula
    name: Pendentes de matrícula
    model: self_service_bi
    explore: alunos
    type: single_value
    fields: [alunos.count_id_cpf]
    filters:
      alunos.id_status_geral: ''
      alunos.ultimo_status_proposta: '2013.1'
      proposta.tipo_proposta: RENOVACAO
      alunos.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#00d397",
        font_color: "#000000", color_application: {collection_id: pravaler, palette_id: pravaler-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 51, background_color: "#FFbc00", font_color: "#000000", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 51, background_color: "#dc2525", font_color: "#FFFFFF", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 4
    col: 0
    width: 8
    height: 2
  - title: Outras pendências
    name: Outras pendências
    model: self_service_bi
    explore: alunos
    type: single_value
    fields: [alunos.count_id_cpf]
    filters:
      alunos.id_status_geral: ''
      alunos.ultimo_status_proposta: 2013.11,2013.16
      proposta.tipo_proposta: RENOVACAO
      alunos.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#00d397",
        font_color: "#000000", color_application: {collection_id: pravaler, palette_id: pravaler-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 51, background_color: "#FFbc00", font_color: "#000000", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 50, background_color: "#dc2525", font_color: "#FFFFFF", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 4
    col: 16
    width: 8
    height: 2
  - title: Pendentes por desconto
    name: Pendentes por desconto
    model: self_service_bi
    explore: alunos
    type: single_value
    fields: [alunos.count_id_cpf]
    filters:
      alunos.id_status_geral: ''
      alunos.ultimo_status_proposta: '2013.14'
      proposta.tipo_proposta: RENOVACAO
      alunos.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#00d397",
        font_color: "#000000", color_application: {collection_id: pravaler, palette_id: pravaler-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 51, background_color: "#ffbc00", font_color: "#000000", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 50, background_color: "#dc2525", font_color: "#FFFFFF", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 4
    col: 8
    width: 8
    height: 2
  - title: Quantidade de Alunos Renovação Cedidos por Mês
    name: Quantidade de Alunos Renovação Cedidos por Mês
    model: self_service_bi
    explore: jornada
    type: looker_line
    fields: [jornada.count_cpf, jornada.dt_status_year, jornada.dt_status_month_name]
    pivots: [jornada.dt_status_year]
    fill_fields: [jornada.dt_status_year, jornada.dt_status_month_name]
    filters:
      jornada.etapa: Cedido
      jornada.status_etapa: '1'
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      jornada.dt_status_year: 3 years
      jornada.tipo_proposta: RENOVACAO
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
    sorts: [jornada.dt_status_year, jornada.dt_status_month_name]
    limit: 500
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: jornada.count_cpf, id: 2019
              - jornada.count_cpf, name: '2019'}, {axisId: jornada.count_cpf, id: 2020
              - jornada.count_cpf, name: '2020'}, {axisId: jornada.count_cpf, id: 2021
              - jornada.count_cpf, name: '2021'}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      2019 - jornada.count_cpf: "#c58f6a"
      2021 - jornada.count_cpf: "#FF6315"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 13
    col: 0
    width: 20
    height: 6
  - name: Funil de Alunos Renovação
    type: text
    title_text: Funil de Alunos Renovação
    subtitle_text: Quantidade de alunos de renovação por etapa do funil e conversão
    body_text: ''
    row: 27
    col: 0
    width: 24
    height: 2
  - name: Alunos Renovação Cedidos e Repasse
    type: text
    title_text: Alunos Renovação Cedidos e Repasse
    subtitle_text: Quantidade de alunos de renovação que foram cedidos por mês e valores
      repassados
    body_text: ''
    row: 11
    col: 0
    width: 24
    height: 2
  - title: Funil 2021
    name: Funil 2021
    model: self_service_bi
    explore: jornada
    type: looker_funnel
    fields: [jornada.etapa, jornada.count_cpf]
    filters:
      jornada.etapa: Elegivel,Aprovado Behavior,Aprovado Instituicao,Aguardando Documento,Aguardando
        Assinatura,Formalizado,Cedido
      jornada.dt_status_date: 2021/01/01 to 2021/12/01
      jornada.status_etapa: '1'
      jornada.tipo_proposta: RENOVACAO
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
    sorts: [jornada.etapa]
    limit: 500
    total: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: prior
    percentPosition: left
    valuePosition: left
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: pravaler
      custom:
        id: 186a2795-e956-4647-78d7-b71375a065c8
        label: Custom
        type: discrete
        colors:
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
        - "#FF6315"
      options:
        steps: 5
    isStepped: true
    series_types: {}
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields:
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 29
    col: 0
    width: 12
    height: 8
  - title: Funil 2020
    name: Funil 2020
    model: self_service_bi
    explore: jornada
    type: looker_funnel
    fields: [jornada.etapa, jornada.count_cpf]
    filters:
      jornada.etapa: Elegivel,Aprovado Behavior,Aprovado Instituicao,Aguardando Documento,Aguardando
        Assinatura,Formalizado,Cedido
      jornada.dt_status_date: 2020/01/01 to 2020/12/31
      jornada.status_etapa: '1'
      jornada.tipo_proposta: RENOVACAO
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
    sorts: [jornada.etapa]
    limit: 500
    total: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: prior
    percentPosition: left
    valuePosition: left
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: pravaler
      custom:
        id: aa8d9446-a09b-b3c4-0cfd-080dab5aa40e
        label: Custom
        type: discrete
        colors:
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
        - "#a661f6"
      options:
        steps: 5
    isStepped: true
    series_types: {}
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 29
    col: 12
    width: 12
    height: 8
  - title: '2021'
    name: '2021'
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.count_cpf]
    filters:
      jornada.etapa: Cedido
      jornada.dt_status_year: 2021/01/01 to 2021/12/31
      jornada.status_etapa: '1'
      jornada.tipo_proposta: RENOVACAO
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
    sorts: [jornada.count_cpf desc]
    limit: 500
    total: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FF6315"
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 13
    col: 20
    width: 4
    height: 2
  - title: Valor de Repasse de Alunos Renovação por Mês
    name: Valor de Repasse de Alunos Renovação por Mês
    model: self_service_bi
    explore: financeiro
    type: looker_column
    fields: [financeiro_extrato_titulo.sum_repasse, financeiro_extrato_titulo.sum_repasse_gestao,
      financeiro_extrato_titulo.transferencia_month]
    fill_fields: [financeiro_extrato_titulo.transferencia_month]
    filters:
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.tipo_proposta: RENOVACAO
      financeiro_extrato_titulo.transferencia_month: 1 years
    sorts: [financeiro_extrato_titulo.transferencia_month]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    y_axes: [{label: '', orientation: left, series: [{axisId: financeiro_extrato_titulo.sum_repasse,
            id: financeiro_extrato_titulo.sum_repasse, name: Antecipação}, {axisId: financeiro_extrato_titulo.sum_repasse_gestao,
            id: financeiro_extrato_titulo.sum_repasse_gestao, name: Gestão}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '10'
    label_value_format: '"R$" 0.0, "mil"'
    series_types: {}
    series_colors:
      financeiro_extrato_titulo.sum_repasse: "#16d7c4"
      financeiro_extrato_titulo.sum_repasse_gestao: "#357b76"
    series_labels:
      financeiro_extrato_titulo.sum_repasse: Antecipação
      financeiro_extrato_titulo.sum_repasse_gestao: Gestão
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 19
    col: 0
    width: 24
    height: 6
  - title: '2019'
    name: '2019'
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.count_cpf]
    filters:
      jornada.etapa: Cedido
      jornada.dt_status_year: 2019/01/01 to 2019/12/31
      jornada.status_etapa: '1'
      jornada.tipo_proposta: RENOVACAO
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
    sorts: [jornada.count_cpf desc]
    limit: 500
    total: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#c58f6a"
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 17
    col: 20
    width: 4
    height: 2
  - title: '2020'
    name: '2020'
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.count_cpf]
    filters:
      jornada.etapa: Cedido
      jornada.dt_status_year: 2020/01/01 to 2020/12/31
      jornada.status_etapa: '1'
      jornada.tipo_proposta: RENOVACAO
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
    sorts: [jornada.count_cpf desc]
    limit: 500
    total: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#a661f6"
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 15
    col: 20
    width: 4
    height: 2
  - title: Antecipação
    name: Antecipação
    model: self_service_bi
    explore: financeiro
    type: single_value
    fields: [financeiro_extrato_titulo.sum_repasse]
    filters:
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.tipo_proposta: RENOVACAO
      financeiro_extrato_titulo.transferencia_month: 1 years
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#16d7c4"
    value_format: ''
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 25
    col: 0
    width: 12
    height: 2
  - title: Gestão 2021
    name: Gestão 2021
    model: self_service_bi
    explore: financeiro
    type: single_value
    fields: [financeiro_extrato_titulo.sum_repasse_gestao]
    filters:
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.tipo_proposta: RENOVACAO
      financeiro_extrato_titulo.transferencia_month: 1 years
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#357b76"
    value_format: ''
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 25
    col: 12
    width: 12
    height: 2
  - title: Média em dias dos alunos parados
    name: Média em dias dos alunos parados
    model: self_service_bi
    explore: jornada
    type: single_value
    fields: [jornada.tempo_status]
    filters:
      jornada.status_etapa: '1'
      jornada.tipo_proposta: RENOVACAO
      proposta.flg_proposta_atual: 'Yes'
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      jornada.etapa_ultimo_status_renovacao: Tela da Instituição
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 8, background_color: "#00d397",
        font_color: "#000000", color_application: {collection_id: pravaler, palette_id: pravaler-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 15, background_color: "#ffbc00", font_color: "#000000", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 14, background_color: "#dc2525", font_color: "#FFFFFF", color_application: {
          collection_id: pravaler, palette_id: pravaler-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
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
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: jornada.tempo_status,
            id: jornada.tempo_status, name: Tempo Status}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Média em dias
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    show_dropoff: false
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 6
    col: 18
    width: 6
    height: 5
  - title: SLA Médio de Aprovação dos Alunos pela IE
    name: SLA Médio de Aprovação dos Alunos pela IE
    model: self_service_bi
    explore: jornada
    type: looker_column
    fields: [jornada.dt_status_month, jornada.sla_apr_ies_renov23]
    fill_fields: [jornada.dt_status_month]
    filters:
      jornada.etapa: Aprovado Instituicao
      jornada.dt_status_month: after 2020/01/01
      jornada.status_etapa: '1'
      jornada.tipo_proposta: RENOVACAO
      proposta.grupo_instituicao: ''
      proposta.ds_instituicao: ''
      proposta.tipo_produto: "-FIES,-INTERCAMBIO"
    sorts: [jornada.dt_status_month]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Média em dias, orientation: left, series: [{axisId: jornada.media_aprovado_instituicao_novos,
            id: jornada.media_aprovado_instituicao_novos, name: Media Aprovado Instituicao
              Novos}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    show_dropoff: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      ID Instituicao: proposta.id_instituicao_filtro
    row: 6
    col: 0
    width: 18
    height: 5
  filters:
  - name: ID Instituicao
    title: ID Instituicao
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: self_service_bi
    explore: jornada
    listens_to_filters: []
    field: proposta.id_instituicao_filtro
  embed_style:
    show_filters_bar: false
