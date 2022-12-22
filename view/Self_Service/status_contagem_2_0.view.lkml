view: status_contagem_2_0 {
  derived_table: {
    sql: select sta.id_cpf as ID_CPF, date(dt_status) as DATE, count(*) as COUNT_2_0 from graduado.self_service_bi.status sta
left join veterano.dimensao.dim_cpf cpf on cpf.id_cpf = sta.id_cpf
where status_destino_detalhado = '2.0'
and dt_status >= '2022-01-01'
group by 1,2 ;;
    persist_for: "1 hour"
  }

  dimension: id_cpf {
    type:  string
    sql: ${TABLE}."ID_CPF" ;;
    hidden: yes
  }

  dimension_group: dt_status {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE" ;;
    hidden: yes
  }

  dimension: count_2_0 {
    type:  string
    sql: ${TABLE}."COUNT_2_0" ;;
    label: "Contagem de Status 2.0"
    group_label: "Contagem de Status"
  }
  }
