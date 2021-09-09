view: orquestra_obj_campos {
  derived_table: {
    sql: select NUMERO_CHAMADO, T.VALUE:"Categoria:"::varchar categoria from GRADUADO.AD_HOC.ORQUESTRA A,
      lateral flatten (input=>OBJ_CAMPOS) T
      where T.VALUE:"Categoria:" IS NOT NULL
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: numero_chamado {
    type: string
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
    hidden:  yes
  }

  dimension: categoria {
    type: string
    sql: ${TABLE}."CATEGORIA" ;;
    label: "CATEGORIA"
    #description: ""
  }

  set: detail {
    fields: [numero_chamado, categoria]
  }
}
