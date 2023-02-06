# The name of this view in Looker is "Metas"
view: metas_provas_pravaler {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."PROVAS_PRAVALER"."METAS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "ID Gc Pipedrive" in Explore.

  dimension: id_gc_pipedrive {
    type: number
    primary_key: yes
    sql: ${TABLE}."ID_GC_PIPEDRIVE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_id_gc_pipedrive {
    type: sum
    sql: ${id_gc_pipedrive} ;;
  }

  measure: average_id_gc_pipedrive {
    type: average
    sql: ${id_gc_pipedrive} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: mes {
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
    sql: ${TABLE}."MES" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  measure: vl_meta_agendamentos {
    type: sum
    sql: ${TABLE}."VL_META_AGENDAMENTOS" ;;
  }

  measure: vl_meta_contrato {
    type: sum
    sql: ${TABLE}."VL_META_CONTRATO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
