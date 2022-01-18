# The name of this view in Looker is "Produto Ies Snapshot"
view: produto_ies_snapshot {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "RISCO"."PRODUTO_IES_SNAPSHOT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Flg Ativo" in Explore.

  dimension: flg_ativo {
    type: yesno
    label: "Ativo?"
    description: "Indica se o contrato do produto com a IES está ativo"
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: id_ies_contrato {
    type: string
    label: "ID Contrato IES"
    description: "Indica o código do contrato por produto para IES"
    sql: ${TABLE}."ID_IES_CONTRATO" ;;
  }

  dimension: id_instituicao {
    type: string
    label: "ID IES"
    description: "Indica o código do IES"
    hidden: yes
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_produto {
    type: string
    label: "ID Produto"
    description: "Indica o código do produto"
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: modalidade_risco {
    type: string
    label: "Modalidade"
    description: "Indica a modalidade do produto"
    sql: ${TABLE}."MODALIDADE_RISCO" ;;
  }

  dimension: nm_produto {
    type: string
    label: "Nome do Produto"
    description: "Indica o nome do produto"
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: snapshot {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Snapshot - Histórico"
    description: "Indica a data do Snapshot da tabela de contratos de produto por instituição de ensino"
    sql: ${TABLE}."SNAPSHOT" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
