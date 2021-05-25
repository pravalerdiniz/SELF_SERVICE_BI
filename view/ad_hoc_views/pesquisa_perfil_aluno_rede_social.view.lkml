view: pesquisa_perfil_aluno_rede_social {
  derived_table: {
    sql: select
      replace(replace(b.value::varchar,'["',''),'"]','') REDE_SOCIAL,
      a."key_"
      FROM graduado.ad_hoc.PESQUISA_PERFIL_ALUNO a,
      lateral flatten (input=>split(REDES_SOCIAIS_USADAS::variant,'|')) b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: rede_social {
    type: string
    sql: ${TABLE}."REDE_SOCIAL" ;;
  }

  dimension: key_ {
    type: string
    sql: ${TABLE}."key_" ;;
    hidden: yes
  }

  set: detail {
    fields: [rede_social, key_]
  }
}
