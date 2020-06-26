view: alunos {
  sql_table_name: "SELF_SERVICE_BI"."ALUNOS"
    ;;

  drill_fields: [aluno_idade]

  dimension: aluno_idade {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "Idade"
    description: "Indica a idade atual do aluno"
    sql: ${TABLE}."ALUNO_IDADE" ;;
  }

  dimension: aluno_genero {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Sexo do Aluno"
    description: "Indica o sexo do aluno"
    sql: ${TABLE}."ALUNO_GENERO" ;;
  }

  dimension: aluno_nome {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome"
    description: "Indica o nome do aluno"
    sql: ${TABLE}."ALUNO_NOME" ;;
  }

  dimension: ano_termino_ensino_medio {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "Ano de Término do Ensino Médio"
    description: "Indica o ano que o aluno terminou o ensino médio"
    sql: ${TABLE}."ANO_TERMINO_ENSINO_MEDIO" ;;
  }

  dimension: area_conhecimento_curso {
    type: string
    group_label: "Dados do Curso"
    group_item_label: "Área de Conhecimento"
    description: "Indica a área de conhecimento do curso. Ex: Ciências Exatas e da Terra, Ciências Biológicas, Engenharia / Tecnologia, Ciências da Saúde, entre outras"
    sql: ${TABLE}."AREA_CONHECIMENTO_CURSO" ;;
  }

  dimension: bairro {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Bairro"
    description: "Indica o bairro que o aluno reside"
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: cargo_atual {
    type: string
    group_label: "Dados da Regional"
    group_item_label: "Cargo - Atual"
    description: "Indica o cargo atual do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARGO_ATUAL" ;;
  }

  dimension: carteira_atual {
    type: string
    group_label: "Dados da Regional"
    group_item_label: "Carteira - Atual"
    description: "Indica o tipo de carteira atual do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARTEIRA_ATUAL" ;;
  }

  dimension: celular {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Celular"
    description: "Indica o número do celular do aluno"
    sql: ${TABLE}."CELULAR" ;;
  }

  dimension: cep {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CEP"
    description: "Indica o número do CEP correspondente ao endereço do aluno"
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Cidade"
    description: "Indica a cidade que o aluno reside"
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: cidade_campus {
    type: string
    group_label: "Dados da Instituição"
    group_item_label: "Cidade - Campus"
    description: "Indica a cidade do campus da instituição de ensino"
    sql: ${TABLE}."CIDADE_CAMPUS" ;;
  }

  dimension: cidade_instituicao {
    type: string
    sql: ${TABLE}."CIDADE_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    description: "Indica a cidade da Instituição de Ensino"

  }


  dimension: conversao_atual {
    type: string
    sql: ${TABLE}."CONVERSAO_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Conversão - Atual"
    description: "Agente de conversão atribuído ao campus atualmente"
  }

  dimension: cp_atual {
    type: string
    sql: ${TABLE}."CP_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "CP - Atual"
    description: "CP do representante atribuído ao campus atualmente"
  }

  dimension_group: data_matricula {
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
    sql: ${TABLE}."DATA_MATRICULA" ;;
  }

  dimension_group: data_primeira_cessao {
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
    sql: ${TABLE}."DATA_PRIMEIRA_CESSAO" ;;
  }

  dimension_group: data_ultima_cessao {
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
    sql: ${TABLE}."DATA_ULTIMA_CESSAO" ;;
  }

  dimension: ds_cal_vet {
    type: string
    sql: ${TABLE}."DS_CAL_VET" ;;
    group_label: "Dados do Curso"
    group_item_label: "Descrição Calouro/Veterano"
    description: "Descreve se o aluno é calouro, veterano ou outros"
  }

  dimension: ds_campus {
    type: string
    sql: ${TABLE}."DS_CAMPUS" ;;
    group_item_label: "Campus"
    group_label: "Dados da Instituição"
    description: "Indica o campus da IE"
  }

  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO" ;;
    group_item_label: "Curso"
    group_label: "Dados do Curso"
    description: "Indica qual o curso do aluno"
  }

  dimension: ds_fundo_investimento {
    type: string
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Descrição do Fundo de Investimento"
    description: "Indica o fundo responsável pelo financiamento"

  }

  dimension: ds_instituicao {
    type: string
    sql: ${TABLE}."DS_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Instituição"
    description: "Indica o nome da IE"
  }

  dimension: ds_trabalha {
    type: string
    sql: ${TABLE}."DS_TRABALHA" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Trabalha?"
    description: "Indica se o aluno trabalha ou não"
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
    group_label: "Dados do Aluno"
    group_item_label: "E-mail"
    description: "Indica o e-mail do aluno"
    suggestable: no
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Endereço do Aluno"
    description: "Indica o e-endereço do aluno"
  }

  dimension: enfase_curso {
    type: string
    sql: ${TABLE}."ENFASE_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "adsadasdsa"
    description: ""
  }

  dimension: escolaridade {
    type: string
    sql: ${TABLE}."ESCOLARIDADE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: estado_civil {
    type: string
    sql: ${TABLE}."ESTADO_CIVIL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_bairro {
    type: string
    sql: ${TABLE}."FIA_BAIRRO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_celular {
    type: string
    sql: ${TABLE}."FIA_CELULAR" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_cep {
    type: string
    sql: ${TABLE}."FIA_CEP" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_cidade {
    type: string
    sql: ${TABLE}."FIA_CIDADE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_email {
    type: string
    sql: ${TABLE}."FIA_EMAIL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_endereco {
    type: string
    sql: ${TABLE}."FIA_ENDERECO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_escolaridade {
    type: string
    sql: ${TABLE}."FIA_ESCOLARIDADE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_estado_civil {
    type: string
    sql: ${TABLE}."FIA_ESTADO_CIVIL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_nacionalidade {
    type: string
    sql: ${TABLE}."FIA_NACIONALIDADE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_natureza_ocupacao {
    type: string
    sql: ${TABLE}."FIA_NATUREZA_OCUPACAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_nome {
    type: string
    sql: ${TABLE}."FIA_NOME" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_numero_dependentes {
    type: number
    sql: ${TABLE}."FIA_NUMERO_DEPENDENTES" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_profissao {
    type: string
    sql: ${TABLE}."FIA_PROFISSAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_renda_mensal {
    type: number
    sql: ${TABLE}."FIA_RENDA_MENSAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_tempo_empresa {
    type: string
    sql: ${TABLE}."FIA_TEMPO_EMPRESA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_tipo_residencia {
    type: string
    sql: ${TABLE}."FIA_TIPO_RESIDENCIA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: fia_uf {
    type: string
    sql: ${TABLE}."FIA_UF" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_aluno_ativo {
    type: yesno
    sql: ${TABLE}."FLG_ALUNO_ATIVO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_campus_ativo {
    type: yesno
    sql: ${TABLE}."FLG_CAMPUS_ATIVO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_curso_ativo {
    type: yesno
    sql: ${TABLE}."FLG_CURSO_ATIVO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_instituicao_ativa {
    type: yesno
    sql: ${TABLE}."FLG_INSTITUICAO_ATIVA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_mae_falecida {
    type: yesno
    sql: ${TABLE}."FLG_MAE_FALECIDA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_pai_falecido {
    type: yesno
    sql: ${TABLE}."FLG_PAI_FALECIDO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_produto_ativo {
    type: yesno
    sql: ${TABLE}."FLG_PRODUTO_ATIVO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_renegociacao {
    type: yesno
    sql: ${TABLE}."FLG_RENEGOCIACAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: gerente_atual {
    type: string
    sql: ${TABLE}."GERENTE_ATUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: gh {
    type: string
    sql: ${TABLE}."GH" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: grupo_instituicao {
    type: string
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_campus {
    type: number
    sql: ${TABLE}."ID_CAMPUS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_curso {
    type: number
    sql: ${TABLE}."ID_CURSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_fia_cpf_atual {
    type: number
    sql: ${TABLE}."ID_FIA_CPF_ATUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_fundo_investimento {
    type: number
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_instituicao {
    type: number
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_produto {
    type: number
    sql: ${TABLE}."ID_PRODUTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_produtos_contratados {
    type: string
    sql: ${TABLE}."ID_PRODUTOS_CONTRATADOS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_proposta_atual {
    type: number
    sql: ${TABLE}."ID_PROPOSTA_ATUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_propostas_enviadas {
    type: string
    sql: ${TABLE}."ID_PROPOSTAS_ENVIADAS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: maturidade_info {
    type: string
    sql: ${TABLE}."MATURIDADE_INFO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nacionalidade {
    type: string
    sql: ${TABLE}."NACIONALIDADE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: natureza_ocupacao {
    type: string
    sql: ${TABLE}."NATUREZA_OCUPACAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nivel_curso {
    type: string
    sql: ${TABLE}."NIVEL_CURSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nm_modalidade_produto {
    type: string
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nm_originador {
    type: string
    sql: ${TABLE}."NM_ORIGINADOR" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: num_da_renovacao {
    type: number
    sql: ${TABLE}."NUM_DA_RENOVACAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: numero_dependentes {
    type: number
    sql: ${TABLE}."NUMERO_DEPENDENTES" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: periodo_curso {
    type: string
    sql: ${TABLE}."PERIODO_CURSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension_group: previsao_formatura {
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
    sql: ${TABLE}."PREVISAO_FORMATURA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: profissao {
    type: string
    sql: ${TABLE}."PROFISSAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: qtd_campus_procurados {
    type: number
    sql: ${TABLE}."QTD_CAMPUS_PROCURADOS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: qtd_contratos_cedidos {
    type: number
    sql: ${TABLE}."QTD_CONTRATOS_CEDIDOS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: qtd_cursos_procurados {
    type: number
    sql: ${TABLE}."QTD_CURSOS_PROCURADOS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
    }

  dimension: qtd_garantidores_diferentes {
    type: number
    sql: ${TABLE}."QTD_GARANTIDORES_DIFERENTES" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: qtd_mensalidade_total {
    type: number
    sql: ${TABLE}."QTD_MENSALIDADE_TOTAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: qtd_parcelas_semestre {
    type: number
    sql: ${TABLE}."QTD_PARCELAS_SEMESTRE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: qtd_propostas_enviadas {
    type: number
    sql: ${TABLE}."QTD_PROPOSTAS_ENVIADAS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: qtd_semestre_curso {
    type: number
    sql: ${TABLE}."QTD_SEMESTRE_CURSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: regional_atual {
    type: string
    sql: ${TABLE}."REGIONAL_ATUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: renda_fam_mensal {
    type: number
    sql: ${TABLE}."RENDA_FAM_MENSAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: renda_mensal {
    type: number
    sql: ${TABLE}."RENDA_MENSAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: representante_atual {
    type: string
    sql: ${TABLE}."REPRESENTANTE_ATUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: safra_cessao_semestre {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_SEMESTRE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: tempo_empresa {
    type: string
    sql: ${TABLE}."TEMPO_EMPRESA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: tipo_atual {
    type: string
    sql: ${TABLE}."TIPO_ATUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: tipo_produto {
    type: string
    sql: ${TABLE}."TIPO_PRODUTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: tipo_renovacao {
    type: string
    sql: ${TABLE}."TIPO_RENOVACAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: tipo_residencia {
    type: string
    sql: ${TABLE}."TIPO_RESIDENCIA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: uf {
    type: string
    sql: ${TABLE}."UF" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: uf_campus {
    type: string
    sql: ${TABLE}."UF_CAMPUS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: uf_instituicao {
    type: string
    sql: ${TABLE}."UF_INSTITUICAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vl_boleto {
    type: number
    sql: ${TABLE}."VL_BOLETO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vl_mensalidade_atual {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_ATUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vl_presente {
    type: number
    sql: ${TABLE}."VL_PRESENTE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vl_score {
    type: number
    sql: ${TABLE}."VL_SCORE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vl_total_financiado {
    type: number
    sql: ${TABLE}."VL_TOTAL_FINANCIADO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vl_total_financiamento_aluno {
    type: number
    sql: ${TABLE}."VL_TOTAL_FINANCIAMENTO_ALUNO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

    measure: count {
      type: count
      drill_fields: [id_cpf]
    }

}
#   measure: count_cpf {
#     type: count_distinct
#     sql: ${cpf} ;;
#     group_label: "Quantidade de Alunos"
#     group_item_label: "Valor"
#     description: "Contagem de CPFs únicos"
#   }

#   measure: perc_cpf {
#     type: percent_of_total
#     sql: ${count_cpf} ;;
#     group_label: "Quantidade de Alunos"
#     group_item_label: "Porcentagem"
#     description: "Porcentagem do total de CPFs únicos"
#   }

#   measure: idade_aluno {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${idade_do_aluno} ;;
#     group_label: "Idade"
#     group_item_label: "Aluno"
#     description: "Média de idade do aluno"
#   }

#   measure: idade_fiador {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${idade_do_fiador} ;;
#     group_label: "Idade"
#     group_item_label: "Garantidor"
#     description: "Média de idade do garantidor"
#   }

#   measure: sum_renda_alu {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_aluno} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Aluno"
#     group_item_label: "Soma"
#     description: "Soma da renda do aluno"
#   }

#   measure: avg_renda_alu {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_aluno} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Aluno"
#     group_item_label: "Média"
#     description: "Média da renda do aluno"
#   }

#   measure: sum_renda_fia {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_fiador} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Garantidor"
#     group_item_label: "Soma"
#     description: "Soma da renda do garantidor"
#   }

#   measure: avg_renda_fia {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_fiador} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Garantidor"
#     group_item_label: "Média"
#     description: "Média da renda do garantidor"
#   }

#   measure: sum_renda_fam {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_familiar} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda Familiar"
#     group_item_label: "Soma"
#     description: "Soma da renda familiar"
#   }

#   measure: avg_renda_fam {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_familiar} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda Familiar"
#     group_item_label: "Média"
#     description: "Média da renda familiar"
#   }

#   measure: iniciar_proposta {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_ini} ;;
#     group_label: "SLA"
#     group_item_label: "Iniciar Proposta"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ser lead e iniciar uma proposta"
#   }

#   measure: finalizar_proposta {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_fin} ;;
#     group_label: "SLA"
#     group_item_label: "Finalizar Proposta"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno iniciar e finalizar uma proposta"
#   }

#   measure: mesa_risco {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_apr_risco} ;;
#     group_label: "SLA"
#     group_item_label: "Mesa de Risco"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno finalizar uma proposta e ser aprovado por risco"
#   }

#   measure: aprovacao_instituicao {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_apr_ies} ;;
#     group_label: "SLA"
#     group_item_label: "Aprovação da Instituição"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ser aprovado por risco e ser aprovado pela instituição"
#   }

#   measure: geracao_contrato {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_cont_ger} ;;
#     group_label: "SLA"
#     group_item_label: "Geração de Contrato"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ser aprovado pela instituição e ter seu contrato gerado"
#   }

#   measure: assinatura_contrato {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_cont_ass} ;;
#     group_label: "SLA"
#     group_item_label: "Assinatura de Contrato"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ter o contrato gerado e assinar o contrato (tanto aluno quanto garantidor)"
#   }

#   measure: formalizacao {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_form} ;;
#     group_label: "SLA"
#     group_item_label: "Formalização"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
#   }

#   measure: cessao {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_ced} ;;
#     group_label: "SLA"
#     group_item_label: "Cessão"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno estar formalizado e ser cedido"
#   }

#   measure: sum_qtd_mens_desej {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_desejada} ;;
#     value_format: "#,###"
#     group_label: "Quantidade de Mensalidade Desejada"
#     group_item_label: "Soma"
#     description: "Soma da quantidade de mensalidades que o aluno pediu no financiamento"
#   }

#   measure: avg_qtd_mens_desej {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_desejada} ;;
#     value_format: "#,###"
#     group_label: "Quantidade de Mensalidade Desejada"
#     group_item_label: "Média"
#     description: "Média da quantidade de mensalidades que o aluno pediu no financiamento"
#   }

#   measure: sum_qtd_mens_fin {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_financiada} ;;
#     value_format: "#,###"
#     group_label: "Quantidade de Mensalidade Financiada"
#     group_item_label: "Soma"
#     description: "Soma da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
#   }

#   measure: avg_qtd_mens_fin {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_financiada} ;;
#     group_label: "Quantidade de Mensalidade Financiada"
#     group_item_label: "Média"
#     description: "Média da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
#   }

#   measure: sum_valor_desej {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Soma"
#     description: "Soma do valor de financiamento desejado"
#   }

#   measure: avg_valor_desej {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Média"
#     description: "Valor médio de financiamento desejado"
#   }

#   measure: min_valor_desej {
#     type: min
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Mínimo"
#     description: "Valor mínimo de financiamento desejado"
#   }

#   measure: max_valor_desej {
#     type: max
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Máximo"
#     description: "Valor máximo de financiamento desejado"
#   }

#   measure: sum_valor_fin {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Soma"
#     description: "Soma dos valores efetivamente financiados pelo PRAVALER"
#   }

#   measure: avg_valor_fin {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Média"
#     description: "Valor médio efetivamente financiado pelo PRAVALER"
#   }

#   measure: min_valor_fin {
#     type: min
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Mínimo"
#     description: "Valor mínimo efetivamente financiado pelo PRAVALER"
#   }

#   measure: max_valor_fin {
#     type: max
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Máximo"
#     description: "Valor máximo efetivamente financiado pelo PRAVALER"
#   }

#   measure: sum_mensalidade {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Soma"
#     description: "Soma do valor de mensalidade"
#   }

#   measure: avg_mensalidade {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Média"
#     description: "Valor médio de mensalidade"
#   }

#   measure: min_mensalidade {
#     type: min
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Mínimo"
#     description: "Valor mínimo de mensalidade"
#   }

#   measure: max_mensalidade {
#     type: max
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Máximo"
#     description: "Valor máximo de mensalidade"
#   }


#   measure: count_proposta {
#     type: count_distinct
#     sql: ${proposta} ;;
#     drill_fields: [cpf,proposta]
#     group_label: "Quantidade de Propostas"
#     group_item_label: "Valor"
#     description: "Contagem única de propostas"
#   }

#   measure: perc_proposta {
#     type: percent_of_total
#     sql: ${count_proposta} ;;
#     group_label: "Quantidade de Propostas"
#     group_item_label: "Porcentagem"
#     description: "Porcentagem do total de propostas únicas"
#   }

#   measure: avg_juros_mensal {
#     type: average
#     sql: ${juros_mensal} ;;
#     group_label: "Juros Total"
#     group_item_label: "Média"
#     description: "Valor médio de juros do contrato"
#   }

#   measure: max_juros_mensal {
#     type: max
#     sql: ${juros_mensal} ;;
#     group_label: "Juros Total"
#     group_item_label: "Máximo"
#     description: "Maior valor de juros do contrato"
#   }

#   measure: min_juros_mensal {
#     type: min
#     sql: ${juros_mensal} ;;
#     group_label: "Juros Total"
#     group_item_label: "Mínimo"
#     description: "Menor valor de juros do contrato"
#   }

#   measure: avg_juros_aluno {
#     type: average
#     sql: ${juros_aluno} ;;
#     group_label: "Juros do Aluno"
#     group_item_label: "Média"
#     description: "Valor médio de juros do aluno"
#   }

#   measure: max_juros_aluno {
#     type: max
#     sql: ${juros_aluno} ;;
#     group_label: "Juros do Aluno"
#     group_item_label: "Máximo"
#     description: "Maior valor de juros do aluno"
#   }

#   measure: min_juros_aluno {
#     type: min
#     sql: ${juros_aluno} ;;
#     group_label: "Juros do Aluno"
#     group_item_label: "Mínimo"
#     description: "Menor valor de juros do aluno"
#   }

#   measure: tempo_status {
#     type: average
#     sql: ${tempo_no_status} ;;
#     group_label: "Tempo no Status"
#     group_item_label: "Dias"
#     value_format: "0"
#     description: "Média de tempo no status"
#   }

#   measure: tempo_status_hora {
#     type: average
#     sql: ${tempo_no_status_hora} ;;
#     group_label: "Tempo no Status"
#     group_item_label: "Horas"
#     value_format: "0"
#     description: "Média de horas no status"
#   }
