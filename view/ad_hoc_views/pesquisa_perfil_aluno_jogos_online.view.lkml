view: pesquisa_perfil_aluno_jogos_online {
  derived_table: {
    sql: select
      replace(replace(b.value::varchar,'["',''),'"]','') jogos_online,
      a."key_"
      FROM graduado.ad_hoc.PESQUISA_PERFIL_ALUNO a,
      lateral flatten (input=>split(JOGA_JOGOS_ONLINE::variant,'|')) b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: jogos_online {
    type: string
    sql: ${TABLE}."JOGOS_ONLINE" ;;
  }

  dimension: key_ {
    type: string
    sql: ${TABLE}."key_" ;;
    hidden: yes
  }

  set: detail {
    fields: [jogos_online, key_]
  }
}
