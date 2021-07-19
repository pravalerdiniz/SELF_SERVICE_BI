view: inep_instituicao {
  derived_table: {
    persist_for: "48 hours"
    sql: select
        GRUPO
          ,f.key as ID_IES
        ,f.value:GRUPO::varchar as GRUPO_IES
      ,f.value:ID_IES::varchar as ID_INSTITUICAO
      ,f.value:NOME_FANTASIA::varchar as NOME_IES
      from GRADUADO.SELF_SERVICE_BI.INEP a,
      lateral flatten (input => ies_pravaler) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: id_ies {
    type: string
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: grupo_ies {
    type: string
    sql: ${TABLE}."GRUPO_IES" ;;
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: nome_ies {
    type: string
    sql: ${TABLE}."NOME_IES" ;;
  }

  set: detail {
    fields: [grupo, id_ies, grupo_ies, id_instituicao, nome_ies]
  }
}
