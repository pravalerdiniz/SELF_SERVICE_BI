view: pesquisa_perfil_aluno_forma_pagamento {
  derived_table: {
    sql: select
      replace(replace(b.value::varchar,'["',''),'"]','') forma_pagamento,
      a."key_"
      FROM graduado.ad_hoc.PESQUISA_PERFIL_ALUNO a,
      lateral flatten (input=>split(FORMAS_PAGAMENTO_COMPRAS::variant,'|')) b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: forma_pagamento {
    type: string
    sql: case when ${TABLE}."FORMA_PAGAMENTO" ilike '%pix%'
    THEN'Pix'
    else ${TABLE}."FORMA_PAGAMENTO"
    end;;
  }

  dimension: key_ {
    type: string
    sql: ${TABLE}."key_" ;;

    hidden: yes
  }

  set: detail {
    fields: [forma_pagamento, key_]
  }
}
