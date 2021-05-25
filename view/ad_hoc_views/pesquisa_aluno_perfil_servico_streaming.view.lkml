view: pesquisa_aluno_perfil_servico_streaming {
  derived_table: {
    sql: select
      replace(replace(b.value::varchar,'["',''),'"]','') UTILIZA_SERVICO_STREAMING,
      a."key_"
      FROM graduado.ad_hoc.PESQUISA_PERFIL_ALUNO a,
      lateral flatten (input=>split(UTILIZA_SERVICO_STREAMING::variant,'|')) b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: utiliza_servico_streaming {
    type: string
    sql: ${TABLE}."UTILIZA_SERVICO_STREAMING" ;;
  }

  dimension: key_ {
    type: string
    sql: ${TABLE}."key_" ;;
    hidden: yes
  }

  set: detail {
    fields: [utiliza_servico_streaming, key_]
  }
}
