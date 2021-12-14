view: status {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."STATUS"
    ;;
  drill_fields: [id]

  dimension: id_usuario {
    type: number
    sql: ${TABLE}."ID_USUARIO" ;;
    group_label:"Dados do Usuário"
    group_item_label: "ID do Usuário"
    description: "Número de identificação do usuário"
  }

  dimension: nm_usuario {
    type: string
    sql: ${TABLE}."NM_USUARIO" ;;
    group_label: "Dados do Usuário"
    group_item_label: " Usuário"
    description: "Indica o nome ou código do usuário"
  }

  dimension: perfil_usuario {
    type: string
    sql: ${TABLE}."PERFIL_USUARIO" ;;
    group_label: "Dados do Usuário"
    group_item_label: "Perfil do Usuário"
    description: "Indica o perfil do usuário. Ex: Aprovado + atendimento, aprovação de alunos, atendimento, BO - Financeiro, etc."
  }

  dimension: tp_usuario {
    type: string
    sql: ${TABLE}."TP_USUARIO" ;;
    group_label: "Dados do Usuário"
    group_item_label: "Tipo de Usuário"
    description: "Este campo é uma regra de negócio*. Indica o Tipo de usuário (ex. Backoffice, Instituição)"
    link: {
      label: "Documentação - Tipo de Usuário"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/789610649/TIPO+DE+USU+RIO"
    }
  }

  dimension: flg_usuario_bloqueado {
    type: yesno
    sql: ${TABLE}."FLG_USUARIO_BLOQUEADO" ;;
    group_label: "Dados do Usuário"
    group_item_label: "Usuário Bloqueado?"
    description: "Indica se o usuário está bloqueado - Sim ou Não"
  }

    dimension: id {
      primary_key: yes
      type: string
      sql: ${TABLE}."ID" ;;
      group_label: "Dados do Status"
      group_item_label: "ID"
      description: "Número de identificação do status"
    }

    dimension: ciclo {
      type: number
      sql: ${TABLE}."CICLO" ;;
      group_label:"Dados do Status"
      value_format: "#"
      group_item_label: "Ciclo"
      description: "Indica o ciclo - Ano e Semestre (ex. 202002 se refere ao segundo semestre de 2020) "
    }


  dimension: cpf_semestre_financiado {
    type: number
    sql: CONCAT(${id_cpf},${ciclo}) ;;
    group_label:"Dados do Status"
    value_format: "#"
    group_item_label: "CPF+Ciclo"
    description: "Indica o CPF + Ciclo do Aluno de Renovação"
    hidden: yes
  }


    dimension: flg_status_atual {
      type: yesno
      sql: ${TABLE}."FLG_STATUS_ATUAL" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Atual"
      description: "Este campo é uma regra de negócio*. Indica se esse é o status atual da proposta do aluno(Sim ou Não)"
      link: {
        label: "Documentação - Status Atual"
        url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/789938179/STATUS+ATUAL"
      }
    }

    dimension: motivo_alteracao {
      type: string
      sql: ${TABLE}."MOTIVO_ALTERACAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Motivo de Alteração"
      description: "Indica o motivo da alteração do status do aluno"
    }

    dimension: status_destino_detalhado {
      type: string
      sql: ${TABLE}."STATUS_DESTINO_DETALHADO" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Destino Detalhado"
      description: "Indica o status destino detalhado"
    }

    dimension: status_destino_detalhado_descricao {
      type: string
      sql: ${TABLE}."STATUS_DESTINO_DETALHADO_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Destino Detalhado"
      description: "Descreve o status destino detalhado"
    }

    dimension: status_destino_geral {
      type: number
      sql: ${TABLE}."STATUS_DESTINO_GERAL" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Destino Geral"
      description: "Indica o status destino geral"
    }

    dimension: status_destino_geral_descricao {
      type: string
      sql: ${TABLE}."STATUS_DESTINO_GERAL_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Destino Geral"
      description: "Descreve o status destino geral"
      }

      dimension: status_origem_detalhado {
      type: string
      sql: ${TABLE}."STATUS_ORIGEM_DETALHADO" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Origem Detalhado"
      description: "Indica o status origem detalhado"
    }

    dimension: status_origem_detalhado_descricao {
      type: string
      sql: ${TABLE}."STATUS_ORIGEM_DETALHADO_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Origem Detalhado "
      description:  "Descreve o status origem detalhado"
    }

    dimension: status_origem_geral {
      type: number
      sql: ${TABLE}."STATUS_ORIGEM_GERAL" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Origem Geral"
      description:  "Indica o status origem geral"
    }

    dimension: status_origem_geral_descricao {
      type: string
      sql: ${TABLE}."STATUS_ORIGEM_GERAL_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Origem Geral"
      description:  "Descreve o status origem geral"
    }

  dimension: grupo_status_origem {
    type: string
    sql: ${TABLE}."GRUPO_STATUS_ORIGEM" ;;
    group_label: "Dados do Status"
    group_item_label: "Grupo de Status Personalizado - Origem"
    description:  "Este campo é uma regra de negócio*. Indica o grupo de status personalizado para análises do funil, criado pelo time de Planejamento Comercial."
  }

  dimension: grupo_status_destino {
    type: string
    sql: ${TABLE}."GRUPO_STATUS_DESTINO" ;;
    group_label: "Dados do Status"
    group_item_label: "Grupo de Status Personalizado - Destino"
    description:  "Este campo é uma regra de negócio*. Indica o grupo de status personalizado para análises do funil, criado pelo time de Planejamento Comercial."

  }

    dimension: fonte {
      type: string
      sql: ${TABLE}."FONTE" ;;
      group_label: "Dados do Status"
      group_item_label: "Fonte"
      description: "Este campo é uma regra de negócio*. Indica a fonte do status (RNV, LOG)"
      link: {
        label: "Documentação - Fonte"
        url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/789741577/FONTE"
      }
    }

  dimension: flg_proposta_atual {
    type: yesno
    label: "Proposta Atual?"
    description: "Indica se é a proposta atual do aluno. Ou seja a última com alteração de status"
    sql: ${TABLE}."FLG_PROPOSTA_ATUAL" ;;
  }

      dimension: id_elegivel {
      type: number
      sql: ${TABLE}."ID_ELEGIVEL" ;;
      group_label: "Dados do Status"
      group_item_label: "ID Elegível"
      description: "Número de identificação de elegível"
    }


  dimension: tempo_no_status {
    type: number
    sql: datediff('day',${dt_status_date},current_date) ;;
    group_label: "Dados do Status"
    group_item_label: "Tempo de Transição no Status"
    description: "Indica a quantidade de dias que o aluno está no status. A partir dele, conseguimos identificar a transição de dias de um status para outro."
    drill_fields: [id_proposta,id_cpf]
    hidden: yes
  }


  dimension: primeira_vez_status_detalhe {
    type: yesno
    sql: ${TABLE}."FLG_STATUS_PERFORMANCE";;
    group_item_label: "Primeira vez no Status Detalhado?"
    description: "Este campo é uma regra de negócio*. Indica a 1ª vez que a proposta do aluno passou por determinado status, mesmo que depois ele retorne no fluxo por alteração manual ou sistêmica."
  link: {
    label: "Documentação - Status Performance (1ª vez no status)"
    url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/786137215/STATUS+-+PERFORMANCE+1+VEZ+NO+STATUS"
  }
 }

  dimension: primeira_vez_status_geral {
    type: yesno
    sql: ${TABLE}."FLG_STATUS_PERFORMANCE_GERAL";;
    group_item_label: "Primeira vez no Status Geral?"
    description: "Este campo é uma regra de negócio*. Indica a 1ª vez que a proposta do aluno passou por determinado status, mesmo que depois ele retorne no fluxo por alteração manual ou sistêmica."
    link: {
      label: "Documentação - Status Performance (1ª vez no status)"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/786137215/STATUS+-+PERFORMANCE+1+VEZ+NO+STATUS"
    }
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
    sql: ${TABLE}."DT_STATUS" ;;
    label: "Status"
    description: "Indica a data do status"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    label: "ID CPF"
    description: "Indica o ID do CPF do aluno"
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    group_label: "Dados da Proposta"
    label: "ID Proposta"
    description: "Indica o ID da proposta"
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
    group_label: "Dados da Proposta"
    label: "Tipo de Proposta"
    description: "Indica o tipo da proposta do aluno. Exemplo: Reempacotado, Renegociação, Renovação, Segundo Repasse, Novo."
    link: {
      label: "Documentação - Tipo de Proposta"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/789577836/TIPO+DE+PROPOSTA"
    }
  }

  dimension: vl_vezes_proposta_no_status {
    type: number
    sql: ${TABLE}."VL_VEZES_PROPOSTA_NO_STATUS" ;;
    group_label: "Dados do Status"
    label: "Número de Vezes no Status"
    description: "Este campo é uma regra de negócio*. Indica o número de vezes em que a proposta passou pelos status"
    link: {
      label: "Documentação - Número de vezes no status"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/789741725/N+MERO+DE+VEZES+NO+STATUS"
    }
  }


  dimension: faixa_tempo_transicao_no_status {
    type: string
    case: {
      when: {
        sql: ${QTD_DIAS_STATUS} <= 5 ;;
        label: "< 5"
      }
      when: {
        sql: ${QTD_DIAS_STATUS}} <= 15 ;;
        label: "5 - 15"
      }
      when: {
        sql: ${QTD_DIAS_STATUS} <= 30 ;;
        label: "15 - 30"
      }
      else: "30 >"
    }
    group_label: "Dados do Status"
    group_item_label: "Faixa de Tempo - Status Anterior (Origem)"
    description: "Indica a faixa de tempo, em dias, que o aluno ficou parado no status de origem."
  }


  dimension: QTD_DIAS_STATUS {
    type: number
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    group_label: "Dados do Status"
    label: "Quantidade de Dias - Status Anterior"
    description: "Este campo é uma regra de negócio*. Indica a quantidade dias que o aluno ficou parado no status de origem"
    link: {
      label: "Documentação - Quantidade de dias - Status Anterior"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/789610674/QUANTIDADE+DE+DIAS+-+STATUS+ANTERIOR"
    }
  }

  dimension: TEMPO_DAY_TRANS_STATUS_ORIGEM {
    type: number
    sql: ${TABLE}."TEMPO_DAY_TRANS_STATUS_ORIGEM" ;;
    group_label: "Dados do Status"
    label: "Tempo Total no Status"
    description: "Indica a quantidade de dias que o aluno ficou em um determinado status, considerando a primeira entrada e a última saída."
  }

  dimension: QTD_DIAS_GRUPO_STATUS_ORIGEM {
    type: number
    sql: ${TABLE}."QTD_DIAS_GRUPO_STATUS_ORIGEM" ;;
    group_label: "Dados do Status"
    label: "Tempo Total no Grupo de Status de Origem"
    description: "Indica a quantidade de dias que o aluno ficou em um determinado grupo de status, considerando a primeira entrada e a última saída."
  }


  dimension: QTD_DIAS_PRIMEIRA_VEZ_ULTIMO_STATUS {
    type: number
    sql: ${TABLE}."DIAS_PRIMEIRA_VEZ_ULTIMO_STATUS" ;;
    group_label: "Dados do Status"
    label: "Tempo Total até o Último Status"
    description: "Indica a quantidade de dias que a proposta está parada no último status, considerando a primeira vez que ele entrou nesse status."
  }


  dimension: QTD_DIAS_PRIMEIRA_VEZ_ULTIMO_GRUPAMENTO {
    type: number
    sql: ${TABLE}."DIAS_PRIMERA_VEZ_ULTIMO_GRUPAMENTO" ;;
    group_label: "Dados do Status"
    label: "Tempo Total até o Último Status no Grupo de Status"
    description: "Indica a quantidade de dias que a proposta está parada no último grupamento, considerando a primeira vez que ele entrou nesse grupamento."
    }



 # dimension: TEMPO_DIAS_TRANS_STATUS {
#    type: number
#    sql: (${TABLE}."TEMPO_SEG_TRANS_STATUS"/86400)::int ;;
#    group_label: "Dados do Status"
#    label: "Dias de Transição do Status "
 #   description: "Indica a quantidade de segundos levaram para mudança ao status de origem"
#  }

  dimension: cpf_aluno {
    sql: ${proposta.cpf_aluno};;
    hidden: yes

  }

  dimension: aluno_email {
    sql: ${proposta.aluno_email};;
    hidden: yes

  }


  dimension: aluno_celular {
    sql: ${proposta.aluno_celular};;
    hidden: yes

  }


  dimension: grupo_instituicao {
    sql: ${proposta.grupo_instituicao};;
    hidden: yes

  }


  dimension: ds_instituicao {
    sql: ${proposta.ds_instituicao};;
    hidden: yes

  }



  dimension: ds_campus {
    sql: ${proposta.ds_campus};;
    hidden: yes

  }





  dimension: nm_modalidade_produto{
    sql: ${proposta.nm_modalidade_produto};;
    hidden: yes

  }


  dimension: nm_produto{
    sql: ${proposta.nm_produto};;
    hidden: yes

  }

  dimension: ds_curso{
    sql: ${proposta.ds_curso};;
    hidden: yes

  }

  dimension: aluno_nome {
    sql: ${proposta.aluno_nome};;
    hidden: yes

  }

  measure: count {
    type: count
    drill_fields: [id, id_proposta, status_origem_geral,status_origem_geral_descricao,status_destino_geral,status_destino_geral_descricao,dt_status_date]
  }

  measure: cont_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    value_format: "0"
    label: "Quantidade de CPFs"
    drill_fields: [cpf_aluno, id_proposta, aluno_nome,
      aluno_email,
aluno_celular,
ds_curso,
grupo_instituicao,
ds_instituicao,
ds_campus,
nm_modalidade_produto,
nm_produto
]
    description: "Contagem de CPFs únicos"
  }


 # measure: sum_trans_status  {
#    type: sum
 #   sql: ${TEMPO_DAY_TRANS_STATUS}_TRANS_STATUS} ;;
#    label: "Tempo de Transição do Status"
#  }



  measure: count_ciclo {
    type: count_distinct
    sql: ${ciclo} ;;
    value_format: "0"
    label: "Quantidade de Ciclo"
    drill_fields: [cpf_aluno, ciclo, id_proposta, tipo_proposta,
      aluno_email,
aluno_celular,
ds_curso,
grupo_instituicao,
ds_instituicao,
ds_campus,
nm_modalidade_produto,
nm_produto
]
    description: "Contagem de Ciclo por proposta"
  }

  measure: cont_proposta {
    type: count_distinct
    sql: ${id_proposta} ;;
    value_format: "0"
    label: "Quantidade de Propostas"
    description: "Contagem de propostas únicas"
  }

  measure: sum_vl_vezes_proposta_no_status {
    type: sum
    sql: ${vl_vezes_proposta_no_status} ;;
    value_format: "0"
    label: "Quantidade de vezes da Proposta no Status"
    description: " Indica a quantidade de vezes que a proposta passou pelo status."
  }

  measure: avg_vl_vezes_proposta_no_status {
    type: average
    sql: ${vl_vezes_proposta_no_status} ;;
    value_format: "$ #,###"
    label: "Média de Vezes da Proposta no Status"
    description: "Média de vezes que a proposta passou pelo status."

  }


  measure: soma_dias_status {
    type: sum
    sql: ${tempo_no_status} ;;
    label:"Tempo de Transição no Status"
    description: "Indica a quantidade de dias que o aluno está no status."
    hidden:  yes
    #não reativar!

  }

  measure: avg_dias_status {
    type: average
    sql: ${tempo_no_status} ;;
    label:"Tempo médio de Transição no Status"
    value_format: "0"
    description: "Indica a média de dias que o aluno está no status."
    hidden:  yes
    #não reativar!

  }


  measure: avg_qtd_dias_status_anterior{
    type: average
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    label: "Tempo médio de Transição no Status"
    value_format: "0"
    description: "Indica a média de dias que o aluno ficou no status. A partir dele, conseguimos identificar a transição de dias de um status para outro."
  }

  measure: sum_qtd_dias_status_anterior{
    type: sum
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    label: "Tempo de Transição no Status"
    value_format: "0"
    description: "Indica a quantidade de dias que o aluno ficou no status. A partir dele, conseguimos identificar a transição de dias de um status para outro."
  }

  measure: med_qtd_dias_status_anterior{
    type: median
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    label: "Tempo de Transição no Status - Mediana"
    value_format: "0"
    hidden:  yes
    description: "Indica a mediana de dias que o aluno ficou no status. A partir dele, conseguimos identificar a transição de dias de um status para outro."
  }


    measure: median_qtd_dias_status_anterior{
    type: median
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    label: "Mediana de quantidade de Dias - Status Anterior"
    value_format: "0"
    description: "Indica a mediana de quantidade dias que o aluno ficou parado no status de origem"
    hidden:yes
  }


  dimension: status_alteracao {

    type: string
    case: {
      when: {
        sql: ${status_origem_detalhado} =  ${status_destino_detalhado} ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '0.0' and ${status_destino_detalhado} in ('1,0','1.1') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} in ('1.1','1.0') and ${status_destino_detalhado} in ('1,1','2.0') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '2.0' and ${status_destino_detalhado} = '2.35' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '2.35' and (${status_destino_detalhado} = '2.37' or
          ${status_destino_geral} = -9090) ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '2.37' and (${status_destino_detalhado} in ('11.0','2.90') or
          ${status_destino_geral} in (10,19,8,9)) ;;
        label: "Certo"
      }
      when: {
        sql: (${status_origem_geral} = -9090 or ${status_origem_detalhado} = '2.90')
          and ${status_destino_detalhado} = '2.0' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_geral} = 8 and ${status_destino_detalhado} in ('2.37','26.1') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_geral} = 9 and (${status_destino_detalhado} in ('10.6','8.7','0.2') or
          ${status_destino_geral} = 11) ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} in ('11.0','11.2') and ${status_destino_geral} in (39,13,14,25) ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_geral} = 13 and (${status_destino_geral} = 25 or
          ${status_destino_detalhado} = '0.1300') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '14.0' and (${status_destino_geral} = 25 or
          ${status_destino_detalhado} = '0.1400') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_geral} = 15 and ${status_destino_geral} in (39,13,14,25)  ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} in ('25.1','25.3','25.4','26.1') and ${status_destino_detalhado} = '31.1' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '25.2' and ${status_destino_detalhado} = '26.1' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} in ('18.0','28.0','38.0','48.0') and ${status_destino_detalhado} = '0.1100' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '31.1' and ${status_destino_detalhado} in ('33.0','33.2','31.4') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} in ('33.0','33.2') and ${status_destino_detalhado} in ('31.0','33.0') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '31.4' and ${status_destino_detalhado} = '34.0' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '34.0' and ${status_destino_detalhado} = '34.1' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '34.1' and ${status_destino_detalhado} = '35.0' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '35.0' and ${status_destino_detalhado} = '40.5' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '40.5' and ${status_destino_detalhado} in ('41.0','42.2') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '42.2' and ${status_destino_detalhado} in ('42.4','41.1') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '42.4' and ${status_destino_detalhado} in ('42.2','41.0') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} in ('41.0','41.1') and ${status_destino_detalhado} in ('50.0','84.0','-99.1') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '50.0' and ${status_destino_detalhado} in ('51.0','57.0') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '84.0' and ${status_destino_detalhado} in ('41.0','41.1') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} = '0.1100' and ${status_destino_detalhado} = '1.1' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} in ('46.1','-99.1') ;;
        label: "Certo"
      }
      when: {
        sql: ${status_origem_detalhado} not in ('0.0','1.1','1.0','2.0','2.35','2.37','2.90','11.0',
                                      '11.2','14.0','14.13','18.0','25.1','25.2','25.3','25.4',
                                      '26.1','28.0','31.1','33.0','33.2','31.4','34.0','34.1','35.0',
                                      '40.5','42.2','42.4','46.1','38.0','48.0','41.0','41.1','50.0',
                                      '84.0','-99.1','0.1100')
              and ${status_origem_geral} not in (-9090,8,9,13,15);;
        label: "Não Atribuído"
      }
      else: "Errado"
    }
    hidden: yes
  }

  dimension: de_para_status_alteracao {
    case: {
      when: {
        sql: ${status_alteracao} = 'Certo' ;;
        label: "Certo"
      }
      when: {
        sql: ${status_alteracao} = 'Não Atribuído' ;;
        label: "Não Atribuído"
      }
      when: {
        sql: ${status_alteracao} = 'Errado' ;;
        label: "Errado"
      }
    }
    label: "Status da Alteração"
    description: "Indica se a alteração está de acordo com o fluxo padrão do PRAVALER"
    hidden: yes
  }

  dimension: etapa_alteracao {
    type: string
    case: {
      when: {
        sql: ${status_destino_geral}  in (0,1) ;;
        label: "Preenchendo Proposta"
      }
      when: {
        sql: ${status_destino_geral} = 2 ;;
        label: "Análise de Risco"
      }
      when: {
        sql: ${status_destino_geral} in (8,9,10,19) ;;
        label: "Não Aprovado por Risco"
      }
      when: {
        sql: ${status_destino_geral} in (11) ;;
        label: "Tela da Instituição"
      }
      when: {
        sql: ${status_destino_geral} in (13,14,39,36) ;;
        label: "Não Aprovado pela Instituição"
      }
      when: {
        sql: ${status_destino_geral} in (25) ;;
        label: "Preenchendo Dados Adicionais"
      }
      when: {
        sql: ${status_destino_geral} in (31) ;;
        label: "Aprovado para Geração de Contrato"
      }
      when: {
        sql: ${status_destino_geral} in (40,42) ;;
        label: "Formalização"
      }
      when: {
        sql: ${status_destino_geral} in (41) ;;
        label: "Formalizado"
      }
      when: {
        sql: ${status_destino_geral} in (46,47,49) ;;
        label: "Não Aprovado pela Formalização"
      }
      when: {
        sql: ${status_destino_geral} in (50) ;;
        label: "Cedido"
      }
      when: {
        sql: ${status_destino_geral} in (51) ;;
        label: "Segundo Repasse"
      }
      else: "Outros"
    }
    label: "Etapa da Alteração"
    hidden: yes
  }

  dimension: etapa_alteracao_geral {
    type: string
    case: {
      when: {
        sql: ${status_destino_geral}  in (0,1) ;;
        label: "Proposta"
      }
      when: {
        sql: ${status_destino_geral} in (2,8,9,10,19) ;;
        label: "Risco"
      }
      when: {
        sql: ${status_destino_geral} in (11,13,14,39,36) ;;
        label: "Tela da Instituição"
      }
      when: {
        sql: ${status_destino_geral} in (25) ;;
        label: "Dados Adicionais"
      }
      when: {
        sql: ${status_destino_geral} in (31) ;;
        label: "Geração de Contrato"
      }
      when: {
        sql: ${status_destino_geral} in (40,42,46,47,49) ;;
        label: "Formalização"
      }
      when: {
        sql: ${status_destino_geral} in (41) ;;
        label: "Formalizado"
      }
      when: {
        sql: ${status_destino_geral} in (50) ;;
        label: "Cedido"
      }
      when: {
        sql: ${status_destino_geral} in (51) ;;
        label: "Segundo Repasse"
      }
      else: "Outros"
    }
    label: "Fluxo"
    hidden: yes
  }

  dimension: alteracao {
    type: string
    sql: concat(${status_origem_geral},' -> ',${status_destino_geral}) ;;
    description: "Concatena o status de origem e de destino"
    hidden: yes
  }

  dimension: estoque_produtivo {
    type: string
    case: {
      when: {
        sql: ${status_destino_detalhado}='1.1'
             AND ${QTD_DIAS_PRIMEIRA_VEZ_ULTIMO_STATUS}<=8;;
        label: "Estoque Produtivo Iniciados"
      }
      when: {
        sql: ${grupo_status_destino}='ESTOQUE TELA DA INSTITUIÇÃO'
          AND ${QTD_DIAS_PRIMEIRA_VEZ_ULTIMO_STATUS}<=20 ;;
        label: "Estoque Produtivo Tela IES"
      }
      when: {
        sql: ${grupo_status_destino}='ESTOQUE DOCUMENTOS'
          AND ${QTD_DIAS_PRIMEIRA_VEZ_ULTIMO_STATUS}<=20 ;;
        label: "Estoque Produtivo Documentos"
      }
      when: {
        sql: ${status_destino_detalhado}='40.5'
          AND ${QTD_DIAS_PRIMEIRA_VEZ_ULTIMO_STATUS}<=8;;
        label: " Estoque Produtivo Assinatura "
      }
      else: "Outros"
    }
    group_label: "Estoque Produtivo"
    group_item_label: " Estoque Produtivo"
    description: "Marcação dos Alunos em Estoque Produtivo"
  }

}
