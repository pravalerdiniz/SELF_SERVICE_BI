view: alunos_negativacao_info {
    derived_table: {
      persist_for: "1 hour"
      sql: select * from (
      select
                  id_cpf,
                  f.key as ds_provedor,
                  f.value:data_insercao::datetime as data_insercao,
                  f.value:ds_operacao::varchar as ds_operacao,
                  f.value:flg_negativado::boolean as flg_negativado,
                  f.value:id_etapa_processamento::int id_processamento,
                  f.value:qtd_dias_atraso::int as qtd_dias_atraso,
                  f.value:seunum::int as id_senum,
                  f.value:data_usuario_update::datetime as data_update,
                  'Aluno' papel
                  from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
                  lateral flatten (input => aluno_negativacao_info) f

      union all

      select
                  id_cpf,
                  f.key as ds_provedor,
                  f.value:data_insercao::datetime as data_insercao,
                  f.value:ds_operacao::varchar as ds_operacao,
                  f.value:flg_negativado::boolean as flg_negativado,
                  f.value:id_etapa_processamento::int id_processamento,
                  f.value:qtd_dias_atraso::int as qtd_dias_atraso,
                  f.value:seunum::int as id_senum,
                  f.value:data_usuario_update::datetime as data_update,
                  'Fiador' papel
                  from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
                  lateral flatten (input => fia_negativacao_info) f
      ) a
 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    measure: sum_qtd_dias {
      type: sum
      group_label: "Quantidade de Dias"
      group_item_label: "Soma"
      description: "Soma da quantidade de dias de atraso para negativação"
      sql: ${qtd_dias_atraso} ;;
    }


    measure: avg_qtd_dias {
      type: average
      group_label: "Quantidade de Dias"
      group_item_label: "Média"
      description: "Média da quantidade de dias de atraso para negativação"
      sql: ${qtd_dias_atraso} ;;
    }

    dimension: id_cpf {
      type: number
      label: "ID CPF"
      description: "ID referente ao CPF do Aluno"
      sql: ${TABLE}."ID_CPF" ;;
    }

    dimension: ds_provedor {
      type: string
      label: "Provedor"
      description: "Indica o provedor da negativação. Ex: Boa Vista ou Serasa"
      sql: ${TABLE}."DS_PROVEDOR" ;;
    }

    dimension_group: data_insercao {
      type: time
      label: "Data de Inserção"
      description: "Indica a data de inserção do registro"
      sql: ${TABLE}."DATA_INSERCAO" ;;
    }


  dimension_group: data_update {
    type: time
    label: "Data de Atualização"
    description: "Indica a data de atualização do registro"
    sql: ${TABLE}."DATA_UPDATE" ;;
  }




    dimension: ds_operacao {
      type: string
      label: "Operação"
      description: "Indica o tipo de operação do arquivo. Ex: Inclusão ou Exclusão"
      sql: ${TABLE}."DS_OPERACAO" ;;
    }

    dimension: flg_negativado {
      type: yesno
      label: "Negativado?"
      description: "Indica se o aluno ou garantidor está negativado"
      sql: ${TABLE}."FLG_NEGATIVADO" ;;
    }

    dimension: id_processamento {
      type: number
      label: "Etapa de Processamento"
      description: "Indica o ID da etapa de processamento do arquivo"
      sql: ${TABLE}."ID_PROCESSAMENTO" ;;
    }

    dimension: qtd_dias_atraso {
      type: number
      label: "Quantidade de Dias de Atraso"
      description: "Indica a quantidade de dias de atraso do pagamento referente a negativação"
      hidden: yes
      sql: ${TABLE}."QTD_DIAS_ATRASO" ;;
    }

    dimension: id_senum {
      type: number
      label: "Seunum"
      description: "Indica o número do Seunum do Aluno."
      sql: ${TABLE}."ID_SENUM" ;;
    }

  dimension: papel {
    type: string
    label: "Papel"
    description: "Indica qual o papel do negativado. Ex: Aluno ou Garantidor."
    sql: ${TABLE}."PAPEL" ;;
  }

  dimension: key {
    type: string
    sql: concat(${id_cpf},'#',${papel},'#',${ds_provedor}) ;;
    hidden: yes
    primary_key: yes
  }

    set: detail {
      fields: [
        id_cpf,
        ds_provedor,
        data_insercao_time,
        data_update_time,
        ds_operacao,
        flg_negativado,
        id_processamento,
        qtd_dias_atraso,
        id_senum,
        papel
      ]
    }
  }
