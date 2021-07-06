view: institution_cupons {
  derived_table: {
    sql: select
            ID_CURSO,
              f.key as ID_CUPOM,
            f.value:ACTIVE::boolean as FLG_ATIVO,
            f.value:CODE::varchar as CODIGO_CUPOM,
            f.value:DISCOUNT::float as DESCONTO,
            f.value:INSERTED_AT::datetime as INSERIDO_EM,
            f.value:UPDATED_AT::datetime as ATUALIZADO_EM
            from "CURTA"."INSTITUTION" a,
            lateral flatten (input => CUPONS) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_curso {
    type: string
    group_item_label: "ID do Curso"
    description: "Indica o código do curso dentro da instituição de ensino"
    hidden: yes
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_cupom {
    type: string
    group_item_label: "ID do Cupom"
    description: "Indica o ID do cupom"
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."ID_CUPOM" ;;
  }

  dimension: flg_cupom_ativo {
    type: yesno
    group_item_label: "Cupom Ativo?"
    description: "Indica se o cupom está ativo"
    sql: ${TABLE}."FLG_CUPOM_ATIVO" ;;
  }

  dimension: codigo_cupom {
    type: string
    group_item_label: "Codigo do Cupom"
    description: "Indica qual é o código do cupom"
    sql: ${TABLE}."CODIGO_CUPOM" ;;
  }

  dimension: desconto {
    type: number
    group_item_label: "Porcentagem Desconto"
    description: "Indica qual a porcentagem de desconto do cupom"
    sql: ${TABLE}."DESCONTO" ;;
  }

  dimension_group: inserido_em {
    type: time
    group_item_label: "Data Criação do Cupom"
    description: "Indica qual a data que o cupom foi criado"
    sql: ${TABLE}."INSERIDO_EM" ;;
  }

  dimension_group: atualizado_em {
    type: time
    group_item_label: "Data Última Atualização do Cupom"
    description: "Indica qual a data que o cupom foi atualizado"
    sql: ${TABLE}."ATUALIZADO_EM" ;;
  }

  set: detail {
    fields: [
      id_curso,
      id_cupom,
      flg_cupom_ativo,
      codigo_cupom,
      desconto,
      inserido_em_time,
      atualizado_em_time
    ]
  }
}
