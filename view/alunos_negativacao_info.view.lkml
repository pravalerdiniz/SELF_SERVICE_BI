view: alunos_negativacao_info {
    derived_table: {
      sql: select
            id_cpf,
            f.key as ds_provedor,
            f.value:data_insercao::datetime as data_insercao,
            f.value:ds_operacao::varchar as ds_operacao,
            f.value:flg_negativado::boolean as flg_negativado,
            f.value:id_etapa_processamento::int id_processamento,
            f.value:qtd_dias_atraso::int as qtd_dias_atraso,
            f.value:seunum::int as id_senum
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => aluno_negativacao_info) f
 ;;
    }

    measure: count {
      type: count_distinct
      label: "Quantidade de Alunos"
      drill_fields: [detail*]
    }

    measure: sum_qtd_dias {
      type: sum
      group_label: "Quantidade de Dias"
      group_item_label: "Soma"
      description: "Soma da Quantidade de Dias de Atraso do aluno"
      sql: ${qtd_dias_atraso} ;;
    }


    measure: avg_qtd_dias {
      type: average
      group_label: "Quantidade de Dias"
      group_item_label: "Média"
      description: "Média da Quantidade de Dias de Atraso do aluno"
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
      description: "Indica a data de inserção do aluno"
      sql: ${TABLE}."DATA_INSERCAO" ;;
    }

    dimension: ds_operacao {
      type: string
      label: "Operação"
      description: "Indica qual estado do aluno perante o provedor. Ex: Inclusão ou Exclusão"
      sql: ${TABLE}."DS_OPERACAO" ;;
    }

    dimension: flg_negativado {
      type: string
      label: "Negativado?"
      description: "Indica se o aluno está negativado."
      sql: ${TABLE}."FLG_NEGATIVADO" ;;
    }

    dimension: id_processamento {
      type: number
      label: "Etapa de Processamento"
      description: "Indica o ID da Etapa de Processamento do Aluno."
      sql: ${TABLE}."ID_PROCESSAMENTO" ;;
    }

    dimension: qtd_dias_atraso {
      type: number
      label: "Quantidade de Dias de Atraso"
      description: "Indica a quantidade de dias de atraso do aluno referente a negativação."
      sql: ${TABLE}."QTD_DIAS_ATRASO" ;;
    }

    dimension: id_senum {
      type: number
      label: "Seunum"
      description: "Indica o número do Seunum do Aluno."
      sql: ${TABLE}."ID_SENUM" ;;
    }

    set: detail {
      fields: [
        id_cpf,
        ds_provedor,
        data_insercao_time,
        ds_operacao,
        flg_negativado,
        id_processamento,
        qtd_dias_atraso,
        id_senum
      ]
    }
  }
