view: leads_balcao {
  sql_table_name: "GRADUADO"."BALCAO_AFILIADOS"."LEADS_ANALITICO_BALCAO"
    ;;

  dimension: primary_key {
    type:  string
    primary_key: yes
    hidden: yes
    # granularidade
    sql: concat(${cpf_lead}, ${data_proposta_raw}) ;;
  }

  dimension: celular {
    type: number
    sql: ${TABLE}."CELULAR" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Celular do Aluno"
  }


  dimension: cpf_atendente_ies {
    type: number
    sql: ${TABLE}."CPF_ATENDENTE_IES" ;;
    group_label: "Dados do Atendente"
    group_item_label: "CPF do Atendente"
  }

  dimension: cpf_fiador {
    type: number
    sql: ${TABLE}."CPF_FIADOR" ;;
    group_label: "Dados do Garantidor"
    group_item_label: "CPF do Garantidor"
  }

  dimension: cpf_lead {
    type: number
    primary_key: yes
    sql: ${TABLE}."CPF_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "CPF do Aluno"
  }

  dimension_group: data_nascimento_fiador {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    hidden:  yes
    sql: ${TABLE}."DATA_NASCIMENTO_FIADOR" ;;
  }

  dimension_group: data_preenchimento_dados {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_PREENCHIMENTO_DADOS" ;;
    label: "Data de Preenchimento"
    hidden:  yes
  }

  dimension_group: data_proposta {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_PROPOSTA" ;;
    label: "Data da Proposta"
  }

  dimension_group: data_retorno_avaliacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_RETORNO_AVALIACAO" ;;
    label: "Data de Retorno da Avaliação"
  }

  dimension: descricao_estado_civil_fiador {
    type: string
    sql: ${TABLE}."DESCRICAO_ESTADO_CIVIL_FIADOR" ;;
    hidden:  yes
  }

  dimension: descricao_parentesco_estudante {
    type: string
    sql: ${TABLE}."DESCRICAO_PARENTESCO_ESTUDANTE" ;;
    group_label: "Dados do Garantidor"
    group_item_label: "Parentesco com o Aluno"
  }

  dimension: descricao_retorno_avaliacao {
    type: string
    sql: ${TABLE}."DESCRICAO_RETORNO_AVALIACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Retorno da Avaliação"
  }

  dimension: ds_profissao_fiador {
    type: string
    sql: ${TABLE}."DS_PROFISSAO_FIADOR" ;;
    group_label: "Dados do Garantidor"
    group_item_label: "Profissão do Garantidor"
  }

  dimension_group: dt_nascimento {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DT_NASCIMENTO" ;;
    label: "Data do Nascimento"
  }

  dimension: email_lead {
    type: string
    sql: ${TABLE}."EMAIL_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Email do Aluno"
  }

  dimension: flg_estudante_veterano {
    type: yesno
    sql: ${TABLE}."FLG_ESTUDANTE_VETERANO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Aluno Veterano?"
  }

  dimension: id_campus {
    type: number
    sql: ${TABLE}."ID_CAMPUS" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID do Campus"
  }

  dimension: id_curso {
    type: number
    sql: ${TABLE}."ID_CURSO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID do Curso"
  }

  dimension: id_estado_civil_fiador {
    type: number
    sql: ${TABLE}."ID_ESTADO_CIVIL_FIADOR" ;;
    hidden:  yes
  }

  dimension: id_instituicao {
    type: number
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID da Instituição"
  }

  dimension: id_lead {
    type: number
    sql: ${TABLE}."ID_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "ID do Aluno"
  }

  dimension: id_parentesco_estudante {
    type: number
    sql: ${TABLE}."ID_PARENTESCO_ESTUDANTE" ;;
    hidden:  yes
  }

  dimension: id_profissao_fiador {
    type: number
    sql: ${TABLE}."ID_PROFISSAO_FIADOR" ;;
    hidden: yes
  }

  dimension: id_proposta_lead_balcao_fiador {
    type: number
    sql: ${TABLE}."ID_PROPOSTA_LEAD_BALCAO_FIADOR" ;;
    hidden:  yes
  }

  dimension: id_proposta_lead_balcao_jornada {
    type: number
    sql: ${TABLE}."ID_PROPOSTA_LEAD_BALCAO_JORNADA" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID da Proposta Balcão"
    hidden:  yes
  }

  dimension: id_retorno_avaliacao {
    type: number
    sql: ${TABLE}."ID_RETORNO_AVALIACAO" ;;
    hidden:  yes
  }

  dimension: id_tela {
    type: number
    sql: ${TABLE}."ID_TELA" ;;
    hidden: yes
  }

  dimension: nome_campus {
    type: string
    sql: ${TABLE}."NOME_CAMPUS" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Nome do Campus"
  }

  dimension: nome_curso {
    type: string
    sql: ${TABLE}."NOME_CURSO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Nome do Curso"
  }

  dimension: nome_instituicao {
    type: string
    sql: ${TABLE}."NOME_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Nome do Instituição"
  }

  dimension: nome_lead {
    type: string
    sql: ${TABLE}."NOME_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nome do Aluno"
  }

  dimension: nome_tela {
    type: string
    sql: ${TABLE}."NOME_TELA" ;;
    hidden:  yes
  }

  dimension: nota_avaliacao_lead {
    type: number
    sql: ${TABLE}."NOTA_AVALIACAO_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Avaliação Lead"
    description: "Nota que é dada de acordo com a tela que o atendente preencheu, ou seja, é um marcador do abandono da jornada."
  }

  dimension: proposta_lead_balcao {
    type: number
    sql: ${TABLE}."PROPOSTA_LEAD_BALCAO" ;;
    hidden: yes
  }

  dimension: qt_parcela_atraso {
    type: number
    sql: ${TABLE}."QT_PARCELA_ATRASO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Qtde de Parcelas em Atraso"
  }

  dimension: sigla_estado_endereco {
    type: string
    sql: ${TABLE}."SIGLA_ESTADO_ENDERECO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "UF do Aluno"
  }

  dimension: valor_renda_mensal_fiador {
    type: number
    sql: ${TABLE}."VALOR_RENDA_MENSAL_FIADOR" ;;
    value_format: "$ #,###.00"
    group_label: "Dados do Garantidor"
    group_item_label: "Renda Mensal do Fiador"
  }

  dimension: vl_mensalidade_curso_bruto {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_CURSO_BRUTO" ;;
    value_format: "$ #,###.00"
    group_label: "Dados da Instituição"
    group_item_label: "Valor da Mensalidade"
  }

  dimension: vl_mensalidade_curso_desconto {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_CURSO_DESCONTO" ;;
    value_format: "$ #,###.00"
    group_label: "Dados da Instituição"
    group_item_label: "Valor da Mensalidade (Desconto)"
  }

  dimension: vl_renda_mensal {
    type: number
    sql: ${TABLE}."VL_RENDA_MENSAL" ;;
    value_format: "$ #,###.00"
    group_label: "Dados do Aluno"
    group_item_label: "Renda Mensal"
  }

  dimension: id_turno {
    type: number
    sql:  ${TABLE}."ID_TURNO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID Turno"
  }

  dimension: turno {
    type: string
    sql: ${TABLE}."TURNO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Turno"
  }

  dimension: id_nivel {
    type: number
    sql: ${TABLE}."ID_NIVEL" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID Nivel"
  }

  dimension: nivel_graduacao {
    type: string
    sql: ${TABLE}."NIVEL_GRADUACAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Nivel Graduacao"
  }

  dimension: flag_fiador {
    type: yesno
    sql: ${cpf_fiador} is not null ;;
    group_label: "Dados do Garantidor"
    group_item_label: "Flag Garantidor"
  }

  dimension: flag_mensalidades_bruta_descontada {
    type: string
    group_label: "Dados da Instituição"
    group_item_label: "Diferença Mensalidades Bruta e Descontada"
    sql: CASE
          WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto}) > 0 THEN 'Desconto'
          WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto}) < 0 THEN 'Red Flag'
          ELSE 'Igual'
          END ;;
    description: "Regra para calcular identificar se a mensalidade descontada foi menor, igual ou maior que a mensalidade bruta"
  }

  # criação do histograma
  dimension: faixa_delta_bruto_desconto {
    type: string
    group_label: "Dados da Instituição"
    group_item_label: "Faixa Delta Bruto Desconto"
    sql: CASE
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} < 0 THEN '< 0%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} >= 0
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.1 THEN '0-10%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.1
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.2 THEN '10-20%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.2
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.3 THEN '20-30%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.3
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.4 THEN '30-40%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.4
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.5 THEN '40-50%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.5
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.6 THEN '50-60%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.6
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.7 THEN '60-70%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.7
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.8 THEN '70-80%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.8
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 0.9 THEN '80-90%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 0.9
        AND (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} <= 1 THEN '90-100%'
      WHEN (${vl_mensalidade_curso_bruto} - ${vl_mensalidade_curso_desconto})/${vl_mensalidade_curso_bruto} > 1 THEN '> 100%'
      END ;;
    description: "Categorização das faixas dos deltas entre balcão bruto e desconto"
  }

  dimension: faixa_delta_desconto_analise_ies {
    type: string
    group_label: "Dados da Instituição"
    group_item_label: "Faixa Delta Desconto Análise IES"
    sql: CASE
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} < 0 THEN '< 0%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} >= 0
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.1 THEN '0-10%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.1
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.2 THEN '10-20%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.2
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.3 THEN '20-30%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.3
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.4 THEN '30-40%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.4
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.5 THEN '40-50%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.5
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.6 THEN '50-60%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.6
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.7 THEN '60-70%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.7
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.8 THEN '70-80%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.8
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 0.9 THEN '80-90%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 0.9
        AND (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} <= 1 THEN '90-100%'
      WHEN (${vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies})/${vl_mensalidade_curso_desconto} > 1 THEN '> 100%'
      END ;;
    description: "Categorização das faixas dos deltas entre balcão desconto e Análise IES"
  }

  # flags de igualdade entre as mensalidades
  dimension: flag_igual_cadastro_inst_balcao_bruto {
    type: yesno
    group_label: "Dados da Proposta"
    group_item_label: "Flag Igualdade Cadastro Inst x Balcão Bruto"
    sql: ${instituicao.valor_mensalidade} - ${leads_balcao.vl_mensalidade_curso_bruto} < 1
      AND ${instituicao.valor_mensalidade} - ${leads_balcao.vl_mensalidade_curso_bruto} > -1  ;;
    description: "Informa se o valor da mensalidade cadastrada na Instituição é igual à mensalidade bruta do Balcão"
  }

  dimension: flag_igual_balcao_bruto_desconto {
    type: yesno
    group_label: "Dados da Proposta"
    group_item_label: "Flag Igualdade Balcão Bruto x Balcão Desconto"
    sql: ${leads_balcao.vl_mensalidade_curso_bruto} - ${leads_balcao.vl_mensalidade_curso_desconto} < 1
      AND ${leads_balcao.vl_mensalidade_curso_bruto} - ${leads_balcao.vl_mensalidade_curso_desconto} > -1  ;;
    description: "Informa se o valor da mensalidade cadastrada na Instituição é igual à mensalidade bruta do Balcão"
  }

  dimension: flag_igual_balcao_desconto_analise_ies {
    type: yesno
    group_label: "Dados da Proposta"
    group_item_label: "Flag Igualdade Balcão Desconto Balcão x Análise IES"
    sql: ${leads_balcao.vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies} < 1
      AND ${leads_balcao.vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies} > -1  ;;
    description: "Informa se o valor da mensalidade descontado é igual à mensalidade apresentada na proposta, após a etapa de análise da IES"
  }

  # flags de valores maiores ou menores comparando as mensalidades
  dimension: flag_comparativo_cadastro_inst_balcao_bruto {
    type: string
    group_label: "Dados da Proposta"
    group_item_label: "Flag Diferença entre Cadastro Instituição x Balcão Bruto"
    sql: CASE
          WHEN ${instituicao.valor_mensalidade} - ${leads_balcao.vl_mensalidade_curso_bruto} > 1 THEN 'Maior'
          WHEN ${instituicao.valor_mensalidade} - ${leads_balcao.vl_mensalidade_curso_bruto} < -1 THEN 'Menor'
          ELSE 'Igual'
          END;;
    description: "Informa se a mensalidade cadastrada na Instituição é maior ou menor que a mensalidade do Balcão."
  }

  dimension: flag_comparativo_balcao_bruto_desconto {
    type: string
    group_label: "Dados da Proposta"
    group_item_label: "Flag Diferença entre Mensalidades Balcão Bruto x Balcão Desconto"
    sql: CASE
          WHEN ${leads_balcao.vl_mensalidade_curso_bruto} - ${leads_balcao.vl_mensalidade_curso_desconto} > 1 THEN 'Maior'
          WHEN ${leads_balcao.vl_mensalidade_curso_bruto} - ${leads_balcao.vl_mensalidade_curso_desconto} < -1 THEN 'Menor'
          ELSE 'Igual'
          END;;
    description: "Informa se a mensalidade da Análise IES é maior ou menor que a mensalidade do Balcão Desconto."
  }

  dimension: flag_comparativo_balcao_desconto_analise_ies {
    type: string
    group_label: "Dados da Proposta"
    group_item_label: "Flag Diferença entre Mensalidades Balcão Desconto x Análise IES"
    sql: CASE
          WHEN ${leads_balcao.vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies} > 1 THEN 'Maior'
          WHEN ${leads_balcao.vl_mensalidade_curso_desconto} - ${proposta.mensalidade_ies} < -1 THEN 'Menor'
          ELSE 'Igual'
          END;;
    description: "Informa se a mensalidade da Análise IES é maior ou menor que a mensalidade do Balcão Desconto."
  }

  dimension: flag_ultima_simulacao {
    type: yesno
    group_label: "Dados da Proposta"
    group_item_label: "Flag Última Simulação"
    sql: ${TABLE}."FLG_ULT_SIMULACAO" ;;
    description: "Informa se foi a última simulação realizada pelo aluno no balcão da IES"
  }

  # dimensoes para o desenrola

  dimension: valor_mensalidade_divida {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_DIVIDA" ;;
    value_format: "$ #,###.00"
    group_label: "Desenrola"
    group_item_label: "Valor Mensalidade Dívida"
  }

  dimension: valor_total_divida {
    type: number
    sql: ${TABLE}."VL_TOTAL_DIVIDA" ;;
    value_format: "$ #,###.00"
    group_label: "Desenrola"
    group_item_label: "Valor total da dívida"
    description: "Valor total da dívida do aluno com a IES"
  }

  dimension: qtd_parcela_atraso_proposta {
    type: number
    sql: ${TABLE}."QT_PARCELA_ATRASO_PROPOSTA" ;;
    group_label: "Desenrola"
    group_item_label: "Quantidade de parcelas em atraso"
    description: "Quantidade de parcelas do curso que o aluno possui em atraso"
  }

  dimension: flag_aluno_possui_divida {
    type: yesno
    sql: ${TABLE}."FLG_ALUNO_POSSUI_DIVIDA" ;;
    group_label: "Desenrola"
    group_item_label: "Possui dívida?"
    description: "Flag que indica se o aluno possui alguma dívida com a IES"
  }

  measure: max_data_ultima_simulacao {
    type: date_time
    group_label: "Dados da Proposta"
    group_item_label: "Última Data da Proposta"
    sql: MAX(${data_proposta_raw});;
  }

  measure: count_leads {
    type: count_distinct
    sql: ${cpf_lead} ;;
    label: "Leads"
  }

  measure: valor_mensalidade_bruto {
    type: sum
    sql: ${vl_mensalidade_curso_bruto} ;;
    label: "Valor da Mensalidade Bruto"
  }

  measure: valor_mensalidade_desconto {
    type: sum
    sql: ${vl_mensalidade_curso_desconto} ;;
    label: "Valor da Mensalidade Desconto"
  }

  measure: count_propostas_cfiador {
    type: count_distinct
    sql: ${cpf_lead};;
    label: "Propostas - Com Garantidor"
    filters: [descricao_retorno_avaliacao: "APROVADO, RECUSADO",flag_fiador: "yes"]
  }

  measure: count_propostas {
    type: count_distinct
    sql: ${cpf_lead};;
    label: "Propostas"
    filters: [descricao_retorno_avaliacao: "APROVADO, RECUSADO"]
  }

  measure: count_propostas_aprovadas {
    type:  count_distinct
    sql: ${cpf_lead} ;;
    filters: [descricao_retorno_avaliacao: "APROVADO"]
    label: "Propostas Aprovadas"
  }

  measure: count_simulados {
    type: count_distinct
    sql: ${cpf_lead} ;;
    filters: [nome_instituicao: "-NULL", nome_campus: "-NULL", nome_curso: "-NULL", vl_mensalidade_curso_bruto: "NOT NULL"]
    label: "Simulados"
  }

  # medidas de valores absolutos do delta ticket
  measure: delta_ticket_cadastro_inst_balcao_bruto {
    type: average
    sql: ${leads_balcao.vl_mensalidade_curso_bruto} - ${instituicao.valor_mensalidade}  ;;
    group_label: "Mensalidades"
    group_item_label: "Delta Ticket Balcão Bruto x Cadastro Instituição"
    value_format: "$ #,###.00"
  }

  measure: delta_ticket_balcao_bruto_desconto {
    type: average
    sql: ${leads_balcao.vl_mensalidade_curso_desconto} - ${leads_balcao.vl_mensalidade_curso_bruto}  ;;
    group_label: "Mensalidades"
    group_item_label: "Delta Ticket Balcão Desconto x Balcão Bruto"
    value_format: "$ #,###.00"
  }

  measure: delta_ticket_balcao_desconto_analise_ies {
    type: average
    sql: ${proposta.mensalidade_ies} - ${leads_balcao.vl_mensalidade_curso_desconto}  ;;
    group_label: "Mensalidades"
    group_item_label: "Delta Ticket Análise IES x Balcão Desconto"
    value_format: "$ #,###.00"
  }

  # medidas de percentual do delta ticket
  measure: var_mensalidade_balcao_bruto_vs_instituicao {
    type: average
    sql: ${leads_balcao.vl_mensalidade_curso_bruto}/nullif(${instituicao.valor_mensalidade},0)-1 ;;
    group_label: "Mensalidades"
    group_item_label: "Var % Mensalidade Balcão Bruto x Cadastro Instituição"
    value_format: "0.0%"
  }

  measure: var_mensalidade_balcao_bruto_vs_desconto {
    type: average
    sql: ${leads_balcao.vl_mensalidade_curso_desconto}/nullif(${leads_balcao.vl_mensalidade_curso_bruto},0)-1 ;;
    group_label: "Mensalidades"
    group_item_label: "Var % Mensalidade Balcão Desconto x Balcão Bruto"
    value_format: "0.0%"
  }

  measure: var_mensalidade_balcao_bruto_vs_analise_ies {
    type: average
    sql: ${proposta.mensalidade_ies}/nullif(${leads_balcao.vl_mensalidade_curso_desconto},0)-1 ;;
    group_label: "Mensalidades"
    group_item_label: "Var % Mensalidade Análise IESx Balcão Desconto"
    value_format: "0.0%"
  }

  # medidas do desenrola
  measure: media_qtd_parcelas_atraso {
    type: average
    sql: ${qtd_parcela_atraso_proposta} ;;
    group_label: "Desenrola"
    group_item_label: "Média da Quantidade de Parcelas em Atraso"
    value_format: "0.#"
  }

  measure: soma_valor_total_divida {
    type: sum
    sql: ${valor_total_divida} ;;
    group_label: "Desenrola"
    group_item_label: "Soma do Valor Total da Dívida"
    value_format: "$0.00"
  }
}
