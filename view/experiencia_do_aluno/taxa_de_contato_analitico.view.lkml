view: taxa_de_contato_analitico {
  derived_table: {
    sql: SELECT
          ALUNO.ANO_MES,
          TICKETS.TICKET_CRIADO_EM,
          ALUNO.CPF AS CPF_ALUNO,
          TICKETS.CPF AS CPF_TICKET,
          TICKETS.ZENDESK_ID,
          TICKETS.FORMULARIO,
          TICKETS.MOTIVO_CONTATO,
          TICKETS.SUBMOTIVO_CONTATO,
          TICKETS.FORMULARIO_MOTIVO
      FROM
        (
            SELECT
                (TO_CHAR(DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))), 'YYYY-MM')) AS "ANO_MES",
                alunos."CPF"  AS "CPF",
                COUNT(DISTINCT ( alunos."ID_CPF"  ) ) AS "QTD_ALUNO"
            FROM "GRADUADO"."SELF_SERVICE_BI"."ALUNOS" AS alunos
              LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
                AS proposta ON (alunos."ID_CPF") = (proposta."ID_CPF")
              LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
                AS financeiro ON (alunos."ID_CPF") = (financeiro."ID_CPF") and (financeiro."ID_CONTRATO") = (proposta."ID_PROPOSTA")
              LEFT JOIN (
                          select
                              id_cpf,
                              LEFT(f.value,4)||'-'||RIGHT(f.value,2)||'-'||'01'::varchar as ano_mes
                          from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
                              lateral flatten (input => ATIVO_ANOMES) f
                          )
                AS ano_mes_carteira_ativa ON (ano_mes_carteira_ativa."ID_CPF") = (alunos."ID_CPF") AND (TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD')) = (TO_CHAR(TO_DATE(date_trunc('MONTH', DATA_VENCIMENTO )), 'YYYY-MM-DD'))
            WHERE (TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))) >= (TO_TIMESTAMP('2021-01-01'))
            GROUP BY
                (DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD')))))),
                2

      ) ALUNO LEFT JOIN (

      SELECT
    (TO_CHAR(DATE_TRUNC('month', tickets_mundiale_zendesk."TICKET_CRIADO_EM" ), 'YYYY-MM')) AS "ANO_MES",
    tickets_mundiale_zendesk."TICKET_CRIADO_EM",
    tickets_mundiale_zendesk."CPF_CLIENTE_NUM"  AS "CPF",
    tickets_mundiale_zendesk."ZENDESK_ID",
    tickets_mundiale_zendesk."FORMULARIO",
    tickets_mundiale_zendesk."SUBMOTIVO_CONTATO_1",
    tickets_mundiale_zendesk."SUBMOTIVO_CONTATO_2",
    tickets_mundiale_zendesk."FORMULARIO_MOTIVO"
FROM "SELF_SERVICE_BI"."TICKETS_MUNDIALE_ZENDESK"
     AS tickets_mundiale_zendesk
WHERE tickets_mundiale_zendesk."FINALIZADO_POR"  = 'ATH' AND tickets_mundiale_zendesk."TICKET_CRIADO_EM" >= TO_TIMESTAMP('2022-01-01') AND tickets_mundiale_zendesk."TIPO_CONTATO"  = 'RECEPTIVO'

      ) TICKETS
      ON (ALUNO."CPF") = (TICKETS."CPF") AND (ALUNO."ANO_MES" = TICKETS."ANO_MES")
      ;;
  }


  dimension: ano_mes {
    type: string
    primary_key: yes
    group_item_label: "Data"
    description: "Mês referente à taxa de contato"
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension_group: ticket_criado_em {

    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TICKET_CRIADO_EM" ;;
  }


  dimension: cpf_ticket {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "CPF Ticket"
    description: "Indica o CPF do aluno cadastrado no ticket."
    sql: ${TABLE}."CPF_TICKET" ;;
  }

  dimension: cpf_aluno {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "CPF Aluno"
    description: "Indica o CPF do aluno da base Alunos."
    sql: ${TABLE}."CPF_ALUNO" ;;
  }


  dimension: zendesk_id {
    type: number
    primary_key: yes
    group_label: "Dados do Ticket"
    group_item_label: "ID Ticket - Zendesk"
    description: "ID do ticket na Zendesk."
    sql: ${TABLE}."ZENDESK_ID" ;;
  }


  dimension: formulario {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Formulário"
    description: "Indica o formulário utilizado para tabulação do ticket."
    sql: ${TABLE}."FORMULARIO" ;;
  }


  dimension: submotivo_contato_1 {
    type: string
    hidden: yes
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Submotivo 1"
    description: "Indica o primeiro submotivo de contato utilizado para tabulação do ticket."
    sql: ${TABLE}."SUBMOTIVO_CONTATO_1" ;;
  }


  dimension: submotivo_contato_2 {
    type: string
    hidden: yes
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Submotivo 2"
    description: "Indica o segundo submotivo de contato utilizado para tabulação do ticket."
    sql: ${TABLE}."SUBMOTIVO_CONTATO_2" ;;
  }



  dimension: formulario_motivo {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Formulário/Motivo de Contato"
    description: "Indica o formulário e todos os submotivos de contato do ticket (Contém todos os níveis de tabulação do motivo de contato)."
    sql: ${TABLE}."FORMULARIO_MOTIVO" ;;
  }

}
