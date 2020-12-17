view: s_op_previsao {
  sql_table_name: "DATA_SCIENCE"."S_OP_PREVISAO"
    ;;

  dimension: canal_url {
    type: string
    sql: ${TABLE}."CANAL_URL" ;;
    label: "Canal da URL"
    description: "Indica qual o canal online de acesso do aluno para conversão. EX: Orgânico, Facebook, Google, Facebook/Instagram, Faculdade."
  }

  dimension: classe_modelo_iniciado {
    type: string
    sql: ${TABLE}."CLASSE_MODELO_INICIADO" ;;
    label: "Classe do Modelo de Propensão de Iniciados"
    description: "Classificação do aluno de acordo com o seu potencial de conversão."
  }

  dimension: distribuicao_media {
    type: string
    sql: ${TABLE}."DISTRIBUICAO_MEDIA" ;;
    hidden: yes
  }

  dimension: distribuicao_otimista {
    type: string
    sql: ${TABLE}."DISTRIBUICAO_OTIMISTA" ;;
    hidden: yes
  }

  dimension: distribuicao_pessismista {
    type: string
    sql: ${TABLE}."DISTRIBUICAO_PESSISMISTA" ;;
    hidden: yes
  }

  dimension: grupo_instituicao {
    type: string
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
    label: "Grupo da Instituição"
    description: "Indica o nome do grupo da instituição."
  }

  dimension_group: mes_inicio_proposta {
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
    sql: ${TABLE}."MES_INICIO_PROPOSTA" ;;
    label: "Mês de Início da Proposta"
    description: "Mês de início da proposta do aluno."
  }

  dimension: qtd_iniciado {
    type: number
    sql: ${TABLE}."QTD_INICIADO" ;;
    hidden: yes
  }

  dimension: qtd_prevista_cedido {
    type: number
    sql: ${TABLE}."QTD_PREVISTA_CEDIDO" ;;
    hidden: yes
  }

  dimension: qtd_prevista_cedido_desvio {
    type: number
    sql: ${TABLE}."QTD_PREVISTA_CEDIDO_DESVIO" ;;
    hidden: yes
  }

  dimension: qtd_prevista_cedido_otimista {
    type: number
    sql: ${qtd_prevista_cedido} + ${qtd_prevista_cedido_desvio} ;;
    hidden: yes
  }

  dimension: qtd_prevista_cedido_pessimista {
    type: number
    sql: case when ${qtd_prevista_cedido} - ${qtd_prevista_cedido_desvio} < 0 then 0
              else ${qtd_prevista_cedido} - ${qtd_prevista_cedido_desvio} end;;
    hidden: yes
  }

  dimension: regiao_campus {
    type: string
    sql: ${TABLE}."REGIAO_CAMPUS" ;;
    label: "Região do Campus"
    description: "Região geográfica do campus do aluno."
  }

  dimension: pk {
    type: string
    sql: concat(${mes_inicio_proposta_raw},'#',
                ${classe_modelo_iniciado}, '#',
                ${grupo_instituicao}, '#',
                ${regiao_campus}, '#',
                ${canal_url});;
    primary_key: yes
    hidden: yes
  }

  dimension_group: mes_base {
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
    sql: ${TABLE}."MES_BASE" ;;
    label: "Mês Base da Previsão"
    description: "Último mês fechado na análise de conversão em até 90 dias, contado a partir da data de análise do modelo."
  }

  dimension: previsao_atual {
    type: yesno
    sql: case when ${mes_base_raw} = (select max(mes_base) from veterano.data_science.s_op_previsao)
              then True
              else False
         end;;
    label: "Previsão Vigente?"
    description: "Indica a previsão mais recente realizada pelo modelo."
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: sum_iniciados {
    type: sum_distinct
    sql: ${qtd_iniciado} ;;
    label: "Volume Iniciados"
    description: "Volume geral de iniciadoss. Não pode ser quebrado por data de formalização."
  }

  measure: sum_projecao_base {
    type: sum_distinct
    sql: ${qtd_prevista_cedido} ;;
    label: "Volume Cedidos - Base"
    description: "Volume geral da projeção de cedidos. Não pode ser quebrado por data de formalização."
  }

  measure: sum_projecao_otimista {
    type: sum_distinct
    sql: ${qtd_prevista_cedido_otimista} ;;
    label: "Volume Cedidos - Otimista"
    hidden: yes
  }

  measure: sum_projecao_pessimista {
    type: sum_distinct
    sql: ${qtd_prevista_cedido_pessimista} ;;
    sql_distinct_key: ${pk} ;;
    label: "Volume Cedidos - Pessimista"
    hidden: yes
  }
}
