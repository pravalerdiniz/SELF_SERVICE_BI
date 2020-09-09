view: alunos_log_negativacao {
  derived_table: {
    sql: select
      LN.key AS ID,
      LN.value:SEUNUM AS SEUNUM,
      LN.value:FLG_NEGATIVADO AS FLG_NEGATIVADO,
      LN.value:ID_ETAPA_PROCESSAMENTO AS ID_ETAPA_PROCESSAMENTO,
      LN.value:ID_ARQUIVO AS ID_ARQUIVO,
      LN.value:ID_PROVEDOR AS ID_PROVEDOR,
      LN.value:ID_FUNDO_INVESTIMENTO AS ID_FUNDO_INVESTIMENTO,
      LN.value:ID_PAPEL AS ID_PAPEL,
      LN.value:DATA_INSERT::datetime AS DATA_INSERT,
      LN.value:DATA_UPDATE::datetime AS DATA_UPDATE,
      ID_CPF
      from "GRADUADO"."SELF_SERVICE_BI"."ALUNOS",
      lateral flatten(input => LOG_NEGATIVACAO) AS LN
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    label: "ID"
    description: "ID da Tabela de Log Negativação"
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."ID" ;;
  }




  dimension: id_cpf {
    type: number
    label: "ID CPF"
    description: "ID referente ao CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: seunum {
    type: string
    label: "Seunum"
    description: "Indica o número do Seunum do Aluno."
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: flg_negativado {
    type: string
    label: "Negativado?"
    description: "Indica se o aluno ou garantidor está negativado"
    sql: ${TABLE}."FLG_NEGATIVADO" ;;
  }

  dimension: id_etapa_processamento {
    type: string
    label: "Etapa de Processamento"
    description: "Indica o ID da etapa de processamento do arquivo"
    sql: ${TABLE}."ID_ETAPA_PROCESSAMENTO" ;;
  }

  dimension: id_arquivo {
    type: string
    label: "ID Arquivo"
    description: "ID do arquivo enviado para o provedor"
    sql: ${TABLE}."ID_ARQUIVO" ;;
  }

  dimension: id_provedor {
    type: string
    label: "Provedor"
    description: "Indica o provedor da negativação. Ex: Boa Vista ou Serasa"
    sql: ${TABLE}."ID_PROVEDOR" ;;
  }

  dimension: id_fundo_investimento {
    type: string
    label: "ID Fundo Investimento"
    description: "ID do fundo de investimento"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_papel {
    type: string
    label: "Papel"
    description: "Indica qual o papel do negativado. Ex: Aluno ou Fiador."
    sql: ${TABLE}."ID_PAPEL" ;;
  }

  dimension_group: data_insert {
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
    label: "Data de Inserção"
    description: "Indica a data de inserção do arquivo"
    sql: ${TABLE}."DATA_INSERT" ;;
  }


  dimension_group: data_update {
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
    label: "Data de atualização"
    description: "Indica a data de atualização do arquivo"
    sql: ${TABLE}."DATA_UPDATE" ;;
  }

  set: detail {
    fields: [
      id,
      seunum,
      flg_negativado,
      id_etapa_processamento,
      id_arquivo,
      id_provedor,
      id_fundo_investimento,
      id_papel
    ]
  }
}
