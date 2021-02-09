view: instituicao_inep {
  derived_table: {
    sql: select id_instituicao,
       f.value:COD_MANTENEDORA::number AS COD_MANTENEDORA,
       f.value:IES_MEC::number AS IES_INEP
from "GRADUADO"."SELF_SERVICE_BI"."INSTITUICAO" a,
lateral flatten(input => obj_inep) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    hidden: yes
  }

  dimension: cod_mantenedora {
    type: number
    sql: ${TABLE}."COD_MANTENEDORA" ;;
    hidden: yes
  }

  dimension: ies_inep {
    type: number
    sql: ${TABLE}."IES_INEP" ;;
    hidden: yes
  }

  set: detail {
    fields: [id_instituicao, cod_mantenedora, ies_inep]
  }
}
