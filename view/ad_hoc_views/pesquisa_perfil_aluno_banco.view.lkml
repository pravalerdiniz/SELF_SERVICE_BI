view: pesquisa_perfil_aluno_banco {
  derived_table: {
    sql: select
      replace(replace(b.value::varchar,'["',''),'"]','') banco,
      a."key_"
      FROM graduado.ad_hoc.PESQUISA_PERFIL_ALUNO a,
      lateral flatten (input=>split(TEM_CONTA_BANCO::variant,'|')) b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: banco {
    type: string
    sql: ${TABLE}."BANCO" ;;
  }

  dimension: key_ {
    type: string
    sql: ${TABLE}."key_" ;;
    hidden: yes
  }

  set: detail {
    fields: [banco, key_]
  }
}
