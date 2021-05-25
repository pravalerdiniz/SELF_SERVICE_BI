view: pesquisa_aluno_perfil_faz_com_frequencia {
  derived_table: {
    sql: select
      replace(replace(b.value::varchar,'["',''),'"]','') FAZ_COM_FREQUENCIA,
      a."key_"
      FROM graduado.ad_hoc.PESQUISA_PERFIL_ALUNO a,
      lateral flatten (input=>split(FAZ_COM_FREQUENCIA::variant,'|')) b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: faz_com_frequencia {
    type: string
    sql: ${TABLE}."FAZ_COM_FREQUENCIA" ;;
  }

  dimension: key_ {
    type: string
    sql: ${TABLE}."key_" ;;
  }

  set: detail {
    fields: [faz_com_frequencia, key_]
  }
}
