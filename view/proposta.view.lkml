view: proposta {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
    ;;

  dimension: aluno_cal_vet {
    type: string
    group_label: "Dados do Aluno"
    label: "Calouro/Veterano?"
    hidden: no
    description: "Indica se o aluno é calouro ou veterano"
    sql: ${TABLE}."ALUNO_CAL_VET" ;;
  }


  dimension: cpf_semestre_financiado {
    type: string
    group_label: "Dados do Aluno"
    label: "CPF + Financiado"
    hidden: yes
    description: "Indica a chave de CPF + Ciclo de renovação do aluno"
    sql:CONCAT(${id_cpf},${semestre_financiado}) ;;
  }

  dimension: aluno_celular {
    type: string
    group_label: "Dados do Aluno"
    label: "Celular do Aluno"
    description: "Indica o número de celular do aluno"
    sql: ${TABLE}."ALUNO_CELULAR" ;;
    required_access_grants: [grupo_telefone]
  }

  dimension: aluno_cidade {
    type: string
    group_label: "Dados do Aluno"
    label: "Cidade do Aluno"
    description: "Indica a cidade de origem do aluno"
    sql: ${TABLE}."ALUNO_CIDADE" ;;
  }

  dimension: aluno_email {
    type: string
    group_label: "Dados do Aluno"
    label: "E-mail do Aluno"
    description: "Indica o e-mail do aluno"
    sql: ${TABLE}."ALUNO_EMAIL" ;;
    required_access_grants: [grupo_email]
  }

  dimension: aluno_escolaridade {
    type: string
    group_label: "Dados do Aluno"
    label: "Nível de Escolaridade"
    description: "Indica o nível de escolaridade do aluno"
    sql: ${TABLE}."ALUNO_ESCOLARIDADE" ;;
  }

  dimension: aluno_genero {
    type: string
    group_label: "Dados do Aluno"
    label: "Gênero do Aluno"
    description: "Indica o sexo do aluno"
    sql: IFNULL(${TABLE}."ALUNO_GENERO",'NÃO INFORMADO') ;;
  }

  dimension: aluno_idade {
    type: number
    group_label: "Dados do Aluno"
    label: "Idade do Aluno"
    description: "Indica a idade do aluno"
    value_format_name: id
    sql: ${TABLE}."ALUNO_IDADE" ;;
  }

  dimension: faixa_etaria_aluno {
    type: tier
    tiers: [16,18,25,30,35,40,50]
    style: integer
    sql: ${aluno_idade} ;;
    drill_fields: [id_cpf, cpf_aluno,aluno_idade, id_proposta, tipo_proposta,renda_familiar,aluno_renda]
    group_label: "Dados do Aluno"
    group_item_label: "Faixa Etária"
    description: "Indica a faixa etária do aluno"
  }

  dimension: aluno_nome {
    type: string
    group_label: "Dados do Aluno"
    label: "Nome do Aluno"
    description: "Indica o nome do aluno"
    sql: ${TABLE}."ALUNO_NOME" ;;
    required_access_grants: [grupo_nome]
  }

  dimension: aluno_renda {
    type: number
    group_label: "Dados do Aluno"
    value_format: "0"
    label: "Renda do Aluno"
    description: "Indica o valor de renda do aluno"
    sql:IFNULL(${TABLE}."ALUNO_RENDA",0) ;;
    drill_fields: [id_cpf, cpf_aluno,id_proposta, tipo_proposta,renda_familiar,aluno_renda]
    required_access_grants: [grupo_renda]
  }

  dimension: faixa_renda_aluno {
    type: tier
    tiers: [1000,2000,3000,4000,6000,8000,10000]
    style: integer
    sql: ${aluno_renda} ;;
    drill_fields: [id_cpf, cpf_aluno,id_proposta, tipo_proposta,renda_familiar,aluno_renda]
    group_label: "Dados do Aluno"
    group_item_label: "Faixa de Renda"
    description: "Indica a faixa de renda do aluno"
  }


  dimension: aluno_uf {
    type: string
    group_label: "Dados do Aluno"
    label: "UF do Aluno"
    description: "Indica a UF de origem do aluno"
    sql: ${TABLE}."ALUNO_UF" ;;
  }



  dimension: gh_bhv{
    type: string
    group_label: "Dados do Aluno"
    label: "GH - Behavior"
    description: "Indica a classificação do Behavior do Aluno. Behavior: Previsão de Inadimplência dado histórico de pagamentos recentes do Aluno."
    sql: ${TABLE}."GH_BHV" ;;
  }


  dimension: mapa_uf_aluno {
    sql: ${TABLE}."ALUNO_UF" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados do Aluno"
    group_item_label: "UF do Aluno - Mapa"
    description: "Indica a UF do aluno, pode ser usado em gráficos de mapa"
  }

  dimension: area_conhecimento_curso {
    type: string
    group_label: "Dados do Curso"
    label: "Área de Conhecimento"
    description: "Indica a área de conhecimento do curso. Ex: Ciências Exatas e da Terra, Ciências Biológicas, Engenharia / Tecnologia, Ciências da Saúde, entre outras"
    sql: ${TABLE}."AREA_CONHECIMENTO_CURSO" ;;
  }

  #dimension: campanha_acesso_conversao {
    #type: string
    #group_label: "Dados de Marketing"
    #label: "URL Conversão - Campanha"
    #description: "Indica qual a campanha de acesso para conversão do aluno. EX: Orgânico, Paid Social, Core Business."
    #sql: ${TABLE}."CAMPANHA_ACESSO_CONVERSAO" ;;
  #}

 # dimension: campanha_acesso_descoberta {
  #  type: string
   # group_label: "Dados de Marketing"
    #label: "URL Descoberta - Campanha"
    #description: "Indica qual a campanha de acesso do aluno para preenchimento da proposta. EX: Orgânico, Paid Social, Core Business."
    #sql: ${TABLE}."CAMPANHA_ACESSO_DESCOBERTA" ;;
  #}

  dimension: canal_acesso_conversao {
    type: string
    group_label: "Dados de Marketing"
    label: "URL Conversão - Canal"
    description: "Indica qual o canal online de acesso do aluno para conversão. Ex: Orgânico, Pago, Faculdade, Itaú, MGM, etc."
    sql: ${TABLE}."CANAL_ACESSO_CONVERSAO" ;;
  }

  dimension: canal_acesso_descoberta {
    type: string
    group_label: "Dados de Marketing"
    label: "URL Descoberta - Canal"
    description: "Indica qual o canal online de acesso do aluno para preenchimento da proposta. Ex: Orgânico, Pago, Faculdade, Itaú, MGM, etc."
    sql: ${TABLE}."CANAL_ACESSO_DESCOBERTA";;
  }

  dimension: canal_detalhado_conversao {
    type: string
    group_label: "Dados de Marketing"
    label: "URL Conversão - Canal Detalhado"
    description: "Indica qual o detalhamento do canal de acesso para conversão do aluno no PRAVALER."
    sql: ${TABLE}."CANAL_DETALHADO_CONVERSAO" ;;
  }

  dimension: canal_detalhado_descoberta {
    type: string
    group_label: "Dados de Marketing"
    label:  "URL Descoberta - Canal Detalhado"
    description: "Indica qual o detalhamento do canal de acesso do aluno no PRAVALER."
    sql: ${TABLE}."CANAL_DETALHADO_DESCOBERTA" ;;
  }


  dimension: carencia {
    type: number
    group_label: "Dados do Contrato"
    label: "Dias de Carência"
    description: "Indica o número em dias da carência do contrato do aluno"
    sql: ${TABLE}."CARENCIA" ;;
    value_format: "0"
  }

  dimension: cargo_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Cargo - Atual"
    description: "Indica o cargo atual do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARGO_ATUAL" ;;
  }

  dimension: cargo_original {
    type: string
    group_label: "Dados da Regional"
    label: "Cargo - Original"
    description: "Indica o cargo original do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARGO_ORIGINAL" ;;
  }

  dimension: carteira_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Carteira - Atual"
    description: "Indica o tipo de carteira atual do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARTEIRA_ATUAL" ;;
  }

  dimension: carteira_original {
    type: string
    group_label: "Dados da Regional"
    label: "Carteira - Original"
    description: "Indica o tipo de carteira original do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARTEIRA_ORIGINAL" ;;
  }

  dimension: cet_aa {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor - CET_AA"
    description: "Indica o valor do Custo Efetivo Total ao ano do contrato."
    sql: ${TABLE}."CET_AA" ;;
  }

  dimension: cet_am {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor - CET_AM"
    description: "Indica o valor do Custo Efetivo Total ao mês do contrato."
    sql: ${TABLE}."CET_AM" ;;
  }

  dimension: cidade_campus {
    type: string
    group_label: "Dados do Campus"
    label: "Cidade do Campus"
    description: "Indica a cidade correspondente ao campus do aluno."
    sql: ${TABLE}."CIDADE_CAMPUS" ;;
    value_format: "0"
  }

  dimension: cidade_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "Cidade da Instituição"
    description: "Indica a cidade correspondente à instituição do aluno."
    sql: ${TABLE}."CIDADE_INSTITUICAO" ;;
  }

  dimension: contrato_versao {
    type: number
    group_label: "Dados do Contrato"
    label: "Versão do Contrato"
    description: "Indica o número da versão do contrato."
    sql: ${TABLE}."CONTRATO_VERSAO" ;;
    value_format: "0"
  }

  dimension: conversao_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Nome - Conversão Atual"
    description: "Indica o nome do representante comercial responsável pela conversão atual na instituição de ensino"
    sql: ${TABLE}."CONVERSAO_ATUAL" ;;
  }

  dimension: conversao_original {
    type: string
    group_label: "Dados da Regional"
    label: "Nome - Conversão Original"
    description: "Indica o nome do representante comercial responsável pela conversão original na instituição de ensino"
    sql: ${TABLE}."CONVERSAO_ORIGINAL" ;;
  }


  dimension:comprometimento_renda {
    type: number
    group_label: "Dados do Curso"
    label: "Comprometimento de Renda"
    value_format: "0.00%"
    description: "Indica qual a porcentagem da renda comprometida do (aluno+fiador) em relação ao valor da mensalidade do curso."
    sql: NULLIF(${vl_mensalidade},0)/(NULLIF(${aluno_renda},0)+NULLIF(${fia_renda},0)) ;;
  }

  dimension: faixa_comprometimento_renda {
    type: string
    group_label: "Dados do Curso"
    label: "Faixa de Comprometimento de Renda"
    value_format: "0.00%"
    description: "Indica qual a faixa de porcentagem da renda que é comprometida do aluno em relação ao valor da mensalidade do curso."
    case: {
      when: {
        sql: ${comprometimento_renda} <= 0.1 ;;
        label: "< 10%"
      }
      when: {
        sql:  ${comprometimento_renda} <= 0.2 ;;
        label: "10% - 20%"
      }
      when: {
        sql:  ${comprometimento_renda}<= 0.3 ;;
        label: "20% - 30%"
      }
      when: {
        sql:  ${comprometimento_renda}<= 0.4 ;;
        label: "30% - 40%"
      }
      when: {
        sql:  ${comprometimento_renda}<= 0.5 ;;
        label: "40% - 50%"
      }
      else: "50% >"
    }





  }




  dimension: cp_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Código do Representante - Atual"
    description: "Indica o código do representante comercial atual na instituição de ensino."
    sql: ${TABLE}."CP_ATUAL" ;;
  }

  dimension: cp_original {
    type: string
    group_label: "Dados da Regional"
    label: "Código do Representante - Original"
    description: "Indica o código do representante comercial original na instituição de ensino."
    sql: ${TABLE}."CP_ORIGINAL" ;;
  }

  dimension: custo_cessao {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor - Custo da Cessão"
    value_format: "0"
    description: "Indica o valor de aquisição do contrato na cessão."
    hidden: yes
    sql: ${TABLE}."CUSTO_CESSAO" ;;
  }

  dimension: custo_originacao {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor - Custo da Original"
    value_format: "0"
    hidden: yes
    description: "Indica o valor de originação quando o fundo de investimento não é BV (Banco Votorantim)."
    sql: ${TABLE}."CUSTO_ORIGINACAO" ;;
  }

  dimension_group: data_concessao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Concessão"
    description: "Indica a data de repasse dos contratos cedidos."
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension_group: data_cessao_original {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Concessão original"
    description: "Indica a data de cessão original."
    sql: ${TABLE}."DATA_CESSAO_ORIGINAL" ;;
  }

  dimension: analise_ytd {
    type: yesno
    label: "Concessão - YTD?"
    description: "Indica o acumulado no ano mês a mês."
    sql:
       ${data_concessao_day_of_year} = 0 < EXTRACT(DOY FROM CURRENT_DATE());;
  }


  dimension_group: data_fechamento_proposta {
    type: time
    timeframes: [
       raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    label: "Fechamento da Proposta"
    description: "Indica a data de fechamento da proposta"
    sql: ${TABLE}."DATA_FECHAMENTO_PROPOSTA" ;;
  }

  dimension_group: data_preenchimento {
    type: time
    timeframes: [
       raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year,
      day_of_week,
      day_of_week_index
    ]
    label: "Preenchimento da Proposta"
    description: "Indica a data de preenchimento da proposta"
    sql: ${TABLE}."DATA_PREENCHIMENTO" ;;
  }

  dimension: wtd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Week to Date"
    type: yesno
    sql:  (EXTRACT(DOW FROM ${data_preenchimento_raw}) < EXTRACT(DOW FROM GETDATE())
                OR
          (EXTRACT(DOW FROM ${data_preenchimento_raw}) = EXTRACT(DOW FROM GETDATE())))  ;;
    description: "Use esse campo para realizar análises entre semanas diferentes usando como base o dia da semana da data corrente."
  }

  dimension: mtd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Month to Date"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${data_preenchimento_raw}) < EXTRACT(DAY FROM GETDATE())
                OR
          (EXTRACT(DAY FROM ${data_preenchimento_raw}) = EXTRACT(DAY FROM GETDATE())))  ;;
    description: "Use esse campo para realizar análises entre meses diferentes usando como base o dia do mês da data corrente."
  }

  dimension: ytd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Year to Date"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${data_preenchimento_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${data_preenchimento_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
    description: "Use esse campo para realizar análises entre anos diferentes usando como base o dia do ano da data corrente."
  }

  dimension_group: data_pri_vecto {
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
    label: "Primeiro Vencimento"
    description: "Indica a data do vencimento do primeiro boleto do contrato"
    sql: ${TABLE}."DATA_PRI_VECTO" ;;
  }

  dimension_group: data_ult_vecto {
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
    label: "Último Vencimento"
    description: "Indica a data do vencimento do último boleto do contrato"
    sql: ${TABLE}."DATA_ULT_VECTO" ;;
  }

  dimension_group: data_validade {
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
    label: "Validade"
    description: "Indica a data máxima que o contrato pode ser aproveitado pela cessão"
    sql: ${TABLE}."DATA_VALIDADE" ;;
  }

  #dimension_group: data_inicio_url {
   # type: time
    #timeframes: [
     # raw,
      #time,
      #date,
      #week,
      #month,
      #quarter,
      #year
    #]
    #label: "URL - Validade Inicial"
    #description: "Indica a data de validade da URL"
    #sql: ${TABLE}."DATA_INICIO_URL" ;;
  #}

  #dimension_group: data_fim_url {
   # type: time
    #timeframes: [
     # raw,
    #  time,
     # date,
    #  week,
     # month,
    #  quarter,
     # year
    #]
    #label: "URL - Validade Final"
    #description: "Indica a data de validade da URL"
    #sql: ${TABLE}."DATA_FIM_URL" ;;
  #}

  dimension: digito_verificador {
    type: number
    group_label: "Dados do Contrato"
    label: "Digito Verificador"
    description: "Indica o número do digito verificado do contrato"
    sql: ${TABLE}."DIGITO_VERIFICADOR" ;;
  }

  dimension: docs_entregues {
    type: string
    group_label: "Dados da Formalização"
    label: "Documentos Entregues"
    description: "Indica todos os documentos entregues para formalização"
    sql: ${TABLE}."DOCS_ENTREGUES" ;;
    html:
    {% assign words = value| split: ','%}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
  }

  dimension: docs_pendentes {
    type: string
    group_label: "Dados da Formalização"
    label: "Documentos Pendentes"
    description: "Indica todos os documentos pendentes para formalização"
    sql: ${TABLE}."DOCS_PENDENTES" ;;
    html:
    {% assign words = value | split: ',' %}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
  }

  dimension: motivo_rejeicao_documento {
    type: string
    group_label: "Dados da Formalização"
    label: "Motivo de rejeição do documento"
    description: "Indica todos os motivos de rejeição dos documentos para formalização"
    sql: ${TABLE}."MOTIVO_REJEICAO_DOCUMENTO" ;;
    html:
    {% assign words = value| split: ','%}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
  }

  dimension: ds_aluno_trabalha {
    type: string
    group_label: "Dados do Aluno"
    label: "Vínculo Empregatício"
    description: "Indica qual o vinculo empregáticio do aluno. Ex: Trabalha, Desempregado, Desempregado com renda."
    sql: ${TABLE}."DS_ALUNO_TRABALHA" ;;
  }

  dimension: ds_campus {
    type: string
    group_label: "Dados do Campus"
    label: "Nome do Campus"
    description: "Indica o nome do campus da instituição de ensino"
    sql: ${TABLE}."DS_CAMPUS" ;;
  }

  dimension: ds_como_soube {
    type: string
    group_label: "Dados de Marketing"
    label: "Como Soube"
    description: "Indica por qual canal de comunicação que o aluno conheceu o PRAVALER. Ex: Atendente da Faculdade, Site da Faculdade, Consultor Pravaler, Google e etc"
    sql: ${TABLE}."DS_COMO_SOUBE" ;;
  }

  dimension: como_soube_canal {
    type: string
    group_label: "Dados de Marketing"
    label: "Como Soube - Canal"
    description: "Indica por qual canal de comunicação online que o aluno conheceu o PRAVALER. EX: Orgânico, Facebook, Google, Facebook/Instagram, Faculdade. "
    sql: ${TABLE}."COMO_SOUBE_CANAL" ;;
  }

  dimension: ds_como_soube_complemento {
    type: string
    group_label: "Dados de Marketing"
    label: "Como Soube - Complemento"
    description: "Indica campo aberto preenchido pelo aluno na proposta complementando como ele conheceu o PRAVALER."
    sql: ${TABLE}."DS_COMO_SOUBE_COMPLEMENTO" ;;
  }

  dimension: ds_curso {
    type: string
    group_label: "Dados do Curso"
    label: "Nome do Curso"
    description: "Indica o nome do curso escolhido pelo aluno na proposta"
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: ds_fia_trabalha {
    type: string
    group_label: "Dados do Fiador"
    label: "Vínculo Empregatício"
    description: "Indica qual o vinculo empregáticio do Fiador. Ex: Trabalha, Desempregado, Desempregado com renda."
    sql: ${TABLE}."DS_FIA_TRABALHA" ;;
  }

  dimension: ds_fundo_investimento {
    type: string
    group_label: "Dados do Fundo de Investimento"
    label: "Nome do Fundo de Investimento"
    description: "Indica o nome do fundo de investimento responsável."
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
  }

  dimension: ds_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "Nome da Instituição"
    description: "Indica o nome da instituição de ensino do aluno."
    sql: ${TABLE}."DS_INSTITUICAO" ;;
  }

  dimension: ds_matriculado {
    type: string
    group_label: "Dados do Aluno"
    label: "Matriculado?"
    description: "Indica se o aluno está matriculado."
    sql: ${TABLE}."DS_MATRICULADO" ;;
  }

  dimension: ds_ult_status {
    type: string
    group_label: "Jornada"
    label: "Último Status"
    description: "Indica a última alteração de status que a proposta teve."
    sql: ${TABLE}."DS_ULT_STATUS" ;;
  }


  dimension: etapa_ult_status {
    type: string
    case: {
      when: {
        sql: ${vl_ult_status}  like  '0%'   ;;
        label: "Preenchendo Proposta"
      }
      when: {
        sql:  ${vl_ult_status}  = 2 ;;
        label: "Análise de Risco"
      }
      when: {
        sql:  ${vl_ult_status} (8,9,10,19) ;;
        label: "Não Aprovado por Risco"
      }
      when: {
        sql:  ${vl_ult_status}  in (11) ;;
        label: "Tela da Instituição"
      }
      when: {
        sql:  ${vl_ult_status}  in (13,14,39,36) ;;
        label: "Não Aprovado pela Instituição"
      }
      when: {
        sql:  ${vl_ult_status}   in (25) ;;
        label: "Preenchendo Dados Adicionais"
      }
      when: {
        sql:  ${vl_ult_status}   in (31) ;;
        label: "Aprovado para Geração de Contrato"
      }
      when: {
        sql:  ${vl_ult_status}   in (40,42) ;;
        label: "Formalização"
      }
      when: {
        sql:  ${vl_ult_status}   in (41) ;;
        label: "Formalizado"
      }
      when: {
        sql:  ${vl_ult_status}  in (46,47,49) ;;
        label: "Não Aprovado pela Formalização"
      }
      when: {
        sql:  ${vl_ult_status}  in (50) ;;
        label: "Cedido"
      }
      when: {
        sql:  ${vl_ult_status}   in (51) ;;
        label: "Segundo Repasse"
      }
      else: "Outros"
    }
    group_label: "Jornada"
    hidden: yes
    group_item_label: "Etapa Atual"
    description: "Etapa do último status do aluno"

}


  dimension: ds_url_conversao {
    type: string
    group_label: "Dados de Marketing"
    label: "URL Conversão - Descrição"
    description: "Indica o canal de URL associada conversão do aluno no site do PRAVALER."
    sql: ${TABLE}."DS_URL_CONVERSAO" ;;
  }

  dimension: ds_url_descoberta {
    type: string
    group_label: "Dados de Marketing"
    label: "URL Descoberta - Descrição"
    description: "Indica o canal de URL associada ao primeiro acesso do aluno no site do PRAVALER."
    sql: ${TABLE}."DS_URL_DESCOBERTA" ;;
  }


  dimension: enfase_curso {
    type: string
    group_label: "Dados do Curso"
    label: "Ênfase do Curso"
    description: "Indica qual é a Enfâse de determinado curso. Ou seja, qual o núcleo de conhecimento especializado."
    sql: ${TABLE}."ENFASE_CURSO" ;;
  }

  dimension: etapa_clicksign {
    type: number
    group_label: "Dados do Contrato"
    label: "Etapa Clicksign"
    description: "Identificador da etapa de processamento da clicksign"
    sql: ${TABLE}."ETAPA_CLICKSIGN" ;;
  }

  dimension: etapa_processamento {
    type: number
    group_label: "Dados do Contrato"
    label: "Etapa de Processamento"
    description: "Indica o número da etapa de processamento do contrato."
    sql: ${TABLE}."ETAPA_PROCESSAMENTO" ;;
  }

  dimension: fia_celular {
    type: string
    group_label: "Dados do Fiador"
    label: "Celular do Fiador"
    description: "Indica o número do celular do Fiador do aluno."
    sql: ${TABLE}."FIA_CELULAR" ;;
    required_access_grants: [grupo_telefone]
  }

  dimension: fia_cidade {
    type: string
    group_label: "Dados do Fiador"
    label: "Cidade do Fiador"
    description: "Indica a cidade de origem do Fiador do aluno."
    sql: ${TABLE}."FIA_CIDADE" ;;
  }

  dimension: fia_email {
    type: string
    group_label: "Dados do Fiador"
    label: "E-mail do Fiador"
    description: "Indica o e-mail do Fiador do aluno."
    sql: ${TABLE}."FIA_EMAIL" ;;
    required_access_grants: [grupo_email]
  }

  dimension: fia_escolaridade {
    type: string
    group_label: "Dados do Fiador"
    label: "Escolaridade do Fiador"
    description: "Indica a escolaridade do Fiador do aluno."
    sql: ${TABLE}."FIA_ESCOLARIDADE" ;;
  }





  dimension: fia_genero {
    type: string
    group_label: "Dados do Fiador"
    label: "Gênero do Fiador"
    description: "Indica o sexo do Fiador do aluno."
    drill_fields: [detail*]
    sql: IFNULL(${TABLE}."FIA_GENERO",'NÃO INFORMADO') ;;
  }

  dimension: fia_idade {
    type: number
    group_label: "Dados do Fiador"
    label: "Idade do Fiador"
    description: "Indica a idade do Fiador do aluno."
    value_format_name: id
    sql: ${TABLE}."FIA_IDADE" ;;
  }

  dimension: faixa_etaria_fiador {
    type: tier
    tiers: [18,25,30,35,40,45,50,55,60]
    style: integer
    sql: ${fia_idade} ;;
    drill_fields: [detail*]
    group_label: "Dados do Fiador"
    group_item_label: "Faixa Etária do Fiador"
    description: "Indica a faixa etária do Fiador"
  }

  dimension: fia_nome {
    type: string
    group_label: "Dados do Fiador"
    label: "Nome do Fiador"
    description: "Indica o nome do Fiador do aluno."
    sql: ${TABLE}."FIA_NOME" ;;
    required_access_grants: [grupo_nome]
  }

  dimension: fia_renda {
    type: number
    group_label: "Dados do Fiador"
    label: "Renda do Fiador"
    value_format: "$ #,##0.00"
    description: "Indica o valor da renda do Fiador do aluno."
    sql: IFNULL(${TABLE}."FIA_RENDA",0) ;;

    required_access_grants: [grupo_renda]
  }

  dimension: faixa_renda_fiador {
    type: tier
    tiers: [1000,2000,3000,4000,6000,8000,10000]
    style: integer
    sql: ${fia_renda} ;;
    group_label: "Dados do Fiador"
    group_item_label: "Faixa de Renda do Fiador"
    description: "Indica a faixa de renda do Fiador"
  }


  dimension: fia_uf {
    type: string
    group_label: "Dados do Fiador"
    label: "UF do Fiador"
    sql: ${TABLE}."FIA_UF" ;;

  }

  dimension: mapa_uf_fiador {
    sql: ${TABLE}."FIA_UF" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados do Fiador"
    group_item_label: "UF do Fiador - Mapa"
    description: "Indica a UF do Fiador, pode ser usado em gráficos de mapa"
  }




  dimension: flg_aceita_termo {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Etapa Clicksign - Aceita Termo?"
    description: "Indica se o aluno aceitou o termo de contração digital"
    sql: ${TABLE}."FLG_ACEITA_TERMO" ;;
  }

  dimension: flg_aceita_termo_Fiador {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Etapa Clicksign - Aceita Termo Fiador?"
    description: "Indica se o Fiador aceitou o termo de contração digital"
    sql: ${TABLE}."FLG_ACEITA_TERMO_GARANTIDOR" ;;
  }

  dimension: flg_aluno_assinou {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Assinou Contrato?"
    description: "Indica se o aluno assinou contrato com PRAVALER"
    sql: ${TABLE}."FLG_ALUNO_ASSINOU" ;;
  }

  dimension: flg_boleto_atrasado {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Boleto Atrasado?"
    description: "Indica se o aluno têm algum boleto atrasado"
    sql: ${TABLE}."FLG_BOLETO_ATRASADO" ;;
  }

  dimension: flg_campus_ativo {
    type: yesno
    group_label: "Dados do Campus"
    label: "Ativo?"
    description: "Indica se o campus está ativo no sistema do PRAVALER"
    sql: ${TABLE}."FLG_CAMPUS_ATIVO" ;;
  }

  dimension: flg_contrato_ativo {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Ativo?"
    description: "Indica se o contrato do aluno está ativo"
    sql: ${TABLE}."FLG_CONTRATO_ATIVO" ;;
  }

  dimension: flg_contrato_cedido {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Cedido?"
    description: "Indica se o contrato do aluno está cedido."
    sql: ${TABLE}."FLG_CONTRATO_CEDIDO" ;;
  }

  dimension: flg_contrato_gerado {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Gerado?"
    description: "Indica se o contrato do aluno foi gerado"
    sql: ${TABLE}."FLG_CONTRATO_GERADO" ;;
  }

  dimension: flg_contrato_ies_ativo {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Contrato Ativo?"
    description: "Indica se o contrato do instituição com o PRAVALER está ativo"
    sql: ${TABLE}."FLG_CONTRATO_IES_ATIVO" ;;
  }

  dimension: flg_contrato_regerado {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Regerado?"
    description: "Indica se o contrato do aluno foi regerado."
    sql: ${TABLE}."FLG_CONTRATO_REGERADO" ;;
  }

  dimension: flg_contrato_unico {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Único?"
    description: "Indica se o contrato do aluno é único."
    sql: ${TABLE}."FLG_CONTRATO_UNICO" ;;
  }

  dimension: flg_curso_ativo {
    type: yesno
    group_label: "Dados do Curso"
    label: "Ativo?"
    description: "Indica se o curso está ativo no sistema do PRAVALER."
    sql: ${TABLE}."FLG_CURSO_ATIVO" ;;
  }

  dimension: flg_sem_concessao {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Sem concessão"
    description: "Indica os contratos gerados sem data de concessão."
    sql: ${TABLE}."FLG_CURSO_ATIVO" ;;
  }



  dimension: flg_fia_assinou {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Assinou Contrato - Fiador?"
    description: "Indica se o fiador assinou o contrato."
    sql: ${TABLE}."FLG_FIA_ASSINOU" ;;
  }

  dimension: flg_financia_matricula_rnv {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Financiou Matricula?"
    description: "Indica se o aluno financiou a primeira matricula."
    sql: ${TABLE}."FLG_FINANCIA_MATRICULA_RNV" ;;
  }

  dimension: flg_instituicao_ativa {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Instituição Ativa?"
    description: "Indica se a instituição está ativa no PRAVALER."
    sql: ${TABLE}."FLG_INSTITUICAO_ATIVA" ;;
  }

  dimension: flg_ipca_ies {
    type: yesno
    group_label: "Dados da Instituição"
    label: "IPCA?"
    description: "Indica se a instituição possui IPCA no contrato com o PRAVALER."
    sql: ${TABLE}."FLG_IPCA_IES" ;;
  }

  dimension: flg_produto_ativo {
    type: yesno
    group_label: "Dados do Produto"
    label: "Ativo?"
    description: "Indica se o produto está ativo no PRAVALER."
    sql: ${TABLE}."FLG_PRODUTO_ATIVO" ;;
  }

  dimension: flg_proposta_atual {
    type: yesno
    group_label: "Dados da Proposta"
    label: "Proposta Atual?"
    description: "Indica se é a proposta atual do aluno. Ou seja a última com alteração de status"
    sql: ${TABLE}."FLG_PROPOSTA_ATUAL" ;;
  }



  dimension: flg_proposta_nao_seguiu {
    type: yesno
    group_label: "Dados da Proposta"
    label: "Proposta Renovação Inativa?"
    description: "Indica se a proposta de renovação está inativa no fluxo de Renovação do Aluno."
    sql: ${TABLE}."FLG_PROPOSTA_NAO_SEGUIU" ;;
  }

  dimension: flg_testemunhas_assinaram {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Assinou Contrato - Testemunhas?"
    description: "Indica se as testemunhas assinaram o contrato."
    sql: ${TABLE}."FLG_TESTEMUNHAS_ASSINARAM" ;;
  }

  dimension: flg_wo_ies {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Tem WriteOff?"
    description: "Indica se a instituição entrou no W.O."
    sql: ${TABLE}."FLG_WO_IES" ;;
  }

  dimension: gerente_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Gerente - Atual"
    description: "Indica o nome do gerente comercial atual responsável pela regional."
    sql: ${TABLE}."GERENTE_ATUAL" ;;
  }

  dimension: gerente_original {
    type: string
    group_label: "Dados da Regional"
    label: "Gerente - Original"
    description: "Indica o nome do gerente comercial original responsável pela regional."
    sql: ${TABLE}."GERENTE_ORIGINAL" ;;
  }

  dimension: gh {
    type: string
    group_label: "Dados do Aluno"
    label: "GH "
    description: "Indica qual GH o aluno está de acordo com a classificação de score do aluno."
    sql: ${TABLE}."GH" ;;
  }

  dimension: grupo_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "Grupo"
    description: "Indica o nome do grupo da instituição."
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
  }

  dimension: id_campus {
    type: string
    group_label: "Dados do Campus"
    label: "ID Campus"
    description: "Indica o ID do campus."
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: id_consultor_finalizou {
    type: string
    group_label: "Dados da Proposta"
    label: "Código do Representante"
    description: "Indica o código do representante comercial que finalizou a proposta."
    sql: ${TABLE}."ID_CONSULTOR_FINALIZOU" ;;
  }




  dimension: id_contrato_conjunto {
    type: string
    group_label: "Dados do Contrato"
    label: "ID Contrato Conjunto"
    description: "Indica o ID do Contrato Conjunto do Aluno. Segunda Etapa do contrato do aluno novo."
    sql: ${TABLE}."ID_CONTRATO_CONJUNTO" ;;
  }

  dimension: id_contrato {
    type: string
    group_label: "Dados do Contrato"
    label: "ID Contrato"
    description: "Indica o ID do Contrato, se vier do BO é o mesmo número da proposta, se for Intercâmbio o número é diferente."
    sql: ${TABLE}."ID_CONTRATO" ;;
  }


  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "ID CPF"
    description: "Indica o código de referência do CPF do aluno."
    value_format: "0"
    sql: ${TABLE}."ID_CPF" ;;
  }


  dimension: cpf_aluno {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF do Aluno"
    description: "Indica o CPF do Aluno"
    value_format: "0"
    sql: ${TABLE}."CPF_ALUNO" ;;
    required_access_grants: [grupo_cpf]

  }

  dimension: id_curso {
    type: string
    group_label: "Dados do Curso"
    label: "ID Curso"
    description: "Indica o ID do Curso do aluno."
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_elegivel {
    type: number
    group_label: "Dados de Renovação"
    label: "ID Elegível"
    description: "Indica código de elegibilidade na proposta de renovação."
    sql: ${TABLE}."ID_ELEGIVEL" ;;
  }

  dimension: id_fia_cpf {
    type: number
    group_label: "Dados do Fiador"
    label: "ID Fiador"
    description: "Indica o ID de referência do CPF do Fiador do aluno."
    sql: ${TABLE}."ID_FIA_CPF" ;;
    value_format: "0"
  }


  dimension: cpf_fiador {
    type: number
    group_label: "Dados do Fiador"
    label: "CPF do Fiador"
    description: "Indica o CPF do Fiador"
    sql: ${TABLE}."CPF_GARANTIDOR" ;;
    value_format: "0"
    required_access_grants: [grupo_cpf]
  }

  dimension: id_fundo_investimento {
    type: number
    group_label: "Dados do Fundo de Investimento"
    label: "ID Fundo de Investimento"
    description: "Indica o ID do Fundo de Investimento."
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_ies_contrato {
    type: number
    group_label: "Dados da Instituição"
    label: "Contrato Instituição"
    description: "Indica o número do contrato da instituição com o PRAVALER."
    sql: ${TABLE}."ID_IES_CONTRATO" ;;
    value_format: "0"
  }

  dimension: id_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "ID Instituição"
    description: "Indica o ID da instituição."
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_originadores_ativos_ies {
    type: string
    group_label: "Dados da Instituição"
    label: "ID Originadores"
    description: "Indica o ID dos Originadores Ativos para determinada instituição."
    sql: ${TABLE}."ID_ORIGINADORES_ATIVOS_IES" ;;
  }

  dimension: id_produto {
    type: string
    group_label: "Dados do Produto"
    label: "ID Produto"
    description: "Indica o ID Produto PRAVALER."
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: id_produtos_aprovados {
    type: string
    group_label: "Dados do Produto"
    label: "ID Produtos Aprovados"
    description: "Indica o ID dos Produtos Aprovados pela instituição ao aluno."
    sql: ${TABLE}."ID_PRODUTOS_APROVADOS" ;;
    html:
    {% assign words = value | split: ',' %}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
  }

  dimension: id_proposta {
    type: string
    group_label: "Dados da Proposta"
    label: "ID Proposta"
    description: "Indica o ID da proposta do aluno."
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
    value_format: "0"
  }

  dimension: id_status_detalhado {
    type: string
    group_label: "Jornada"
    label: "Status Detalhado"
    description: "Indica lista dos códigos de Status Detalhado da proposta."
    sql: ${TABLE}."ID_STATUS_DETALHADO" ;;
  }

  dimension: id_status_geral {
    type: string
    group_label: "Jornada"
    label: "Status Geral"
    description: "Indica lista dos códigos dos Status da proposta."
    sql: ${TABLE}."ID_STATUS_GERAL" ;;
  }

  dimension: id_usuario_finalizou {
    type: string
    group_label: "Dados da Proposta"
    label: "ID Usuario"
    description: "Indica o ID do Usuario do Sistema PRAVALER que finalizou a proposta."
    sql: ${TABLE}."ID_USUARIO_FINALIZOU" ;;
  }

  dimension: link_assinatura_aluno {
    type: string
    group_label: "Dados do Contrato"
    label: "URL - Assinatura Aluno"
    description: "Indica o link da assinatura do contrato pelo aluno."
    sql: ${TABLE}."LINK_ASSINATURA_ALUNO" ;;
  }

  dimension: link_assinatura_fiador {
    type: string
    group_label: "Dados do Contrato"
    label: "URL - Assinatura Fiador"
    description: "Indica o link da assinatura do contrato pelo fiador."
    sql: ${TABLE}."LINK_ASSINATURA_GARANTIDOR" ;;
  }

  dimension: max_boleto_atrasado {
    type: number
    group_label: "Dados do Contrato"
    label: "Dias de atraso - Boleto"
    description: "Indica o número de dias de atraso de pagamento de determinado boleto."
    sql: ${TABLE}."MAX_BOLETO_ATRASADO" ;;
  }

  dimension: faixa_tempo_atraso_boleto {
    type: string
    case: {
      when: {
        sql: ${max_boleto_atrasado} <= 5 ;;
        label: "< 5"
      }
      when: {
        sql: ${max_boleto_atrasado} <= 15 ;;
        label: "5 - 15"
      }
      when: {
        sql: ${max_boleto_atrasado} <= 30 ;;
        label: "15 - 30"
      }
      else: "30 >"
    }
    group_label: "Dados do Contrato"
    group_item_label: "Faixa de Tempo de atraso - Boleto do Aluno"
    description: "Indica a faixa de tempo, em dias de atraso - Boleto do Aluno"
  }

  dimension: nivel_curso {
    type: string
    group_label: "Dados do Curso"
    label: "Nível"
    description: "Indica o nível do curso.Ex: Graduação, Pós-Graduação, Técnico, Intercâmbio"
    sql: ${TABLE}."NIVEL_CURSO" ;;
  }

  dimension: nm_modalidade_produto {
    type: string
    group_label: "Dados do Produto"
    label: "Modalidade"
    description: "Indica a modalidade do produto. Ex: Compartilhado, Gestão e FIDC."
    suggestable: yes
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
  }

  dimension: nm_originador {
    type: string
    group_label: "Dados do Originador"
    label: "Originador"
    description: "Indica o nome do banco originador do empréstimo/financiamento."
    sql: ${TABLE}."NM_ORIGINADOR" ;;
  }

  dimension: nm_produto {
    type: string
    group_label: "Dados do Produto"
    label: "Produto"
    description: "Indica o nome do produto."
    suggestable: yes
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: nm_produto_comercial {
    type: string
    group_label: "Dados do Produto"
    label: "Produto Agrupado"
    description: "Indica o nome do produto com agrupamento pré-definido. Ex: Compra de Carteira, EAD, Controle, Sem Juros, Sem Fiador, Outros."
    suggestable: yes
    sql: ${TABLE}."NM_PRODUTO_COMERCIAL" ;;
  }

  dimension: num_da_renovacao {
    type: number
    group_label: "Dados de Renovação"
    label: "Número de Renovação"
    description: "Indica a quantidade de renovações realizadas do contrato."
    sql: IFNULL(${TABLE}."NUM_DA_RENOVACAO",0) ;;
  }

  dimension: perc_comissao {
    type: number
    group_label: "Dados da Instituição"
    label: "Porcentagem de Comissão da Instituição"
    description: "Indica a porcentagem de comissão recebida da Instituição por produto contratado"
    sql: ${TABLE}."PERC_COMISSAO" ;;

  }

  dimension: perc_desagio {
    type: number
    group_label: "Dados da Instituição"
    label:"Porcentagem de Deságio"
    description:"Indica a porcentagem que a instituição deixa de receber por financiar o curso com o PRAVALER."
    sql: ${TABLE}."PERC_DESAGIO" ;;
  }

  dimension: perc_tx_subsidiado_ies {
    type: number
    group_label: "Dados da Instituição"
    label:"Porcentagem da Taxa Subsidiada"
    description:"Indica a porcentagem da taxa subsidiada pela instituição por contrato."
    sql: ${TABLE}."PERC_TX_SUBSIDIADO_IES" ;;
    value_format: "0.00%"
  }

  dimension: vl_perc_tx_subsidiado_ies {
    type: number
    group_label: "Dados da Instituição"
    label:"Percentual Subsidiado da Taxa"
    description:"Indica o percentual da taxa subsidiado pela instituição por contrato."
    sql: IFNULL(${perc_tx_subsidiado_ies} * ${tx_mensal_total},0) ;;
    value_format: "0.00"
  }




  dimension: periodo_curso {
    type: string
    group_label: "Dados do Curso"
    label:"Periodo"
    description:"Indica o periodo do Curso. Ex: Manhã, EAD, Noite."
    sql: ${TABLE}."PERIODO_CURSO" ;;
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
    label: "Previsão de Formatura"
    sql: ${TABLE}."PREVISAO_FORMATURA" ;;
  }

  dimension: qtd_contratos_anteriores {
    type: number
    group_label: "Dados do Contrato"
    label:"Quantidade de Contratos Anteriores"
    description:"Indica a quantidade de contrato anteriores do aluno."
    sql: ${TABLE}."QTD_CONTRATOS_ANTERIORES" ;;
  }

  dimension: qtd_docs_pendentes {
    type: number
    group_label: "Dados da Formalização"
    label:"Quantidade de Documentos pendentes"
    description: "Indica a quantidade de documentos pendentes por proposta durante a formalização"
    sql: ${TABLE}."QTD_DOCS_PENDENTES" ;;
  }

  dimension: qtd_men_corrente {
    type: number
    group_label: "Dados do Contrato"
    label:"Quantidade de Mensalidades - Semestre Atual"
    description:"Indica a quantidade de mensalidades por contrato do semestre atual."
    sql: ${TABLE}."QTD_MEN_CORRENTE" ;;
  }

  dimension: qtd_mensalidades {
    type: number
    group_label: "Dados do Contrato"
    label:"Quantidade de Mensalidades"
    description:"Indica a quantidade de mensalidades por contrato."
    sql: ${TABLE}."QTD_MENSALIDADES" ;;
  }

  dimension: qtd_prestacoes {
    type: number
    group_label: "Dados do Contrato"
    label:"Quantidade de Prestações"
    description:"Indica a quantidade de prestações por contrato."
    sql: ${TABLE}."QTD_PRESTACOES" ;;
  }

  dimension: qtd_semestre_curso {
    type: number
    group_label: "Dados do Curso"
    label:"Quantidade de Semestres"
    description:"Indica a quantidade de semestres por curso."
    sql: ${TABLE}."QTD_SEMESTRE_CURSO" ;;
  }

  dimension: receita_corban {
    type: number
    group_label: "Dados do Originador"
    label:"Valor de Receita do Correspondente Bancário"
    description:"Indica valor da taxa paga por originador para cada boleto gerado."
    sql: ${TABLE}."RECEITA_CORBAN" ;;
    value_format: "0"
  }

  dimension: regional_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Regional - Atual"
    description: "Indica a regional atribuida ao campus atualmente"
    sql: ${TABLE}."REGIONAL_ATUAL" ;;
  }

  dimension: regional_original {
    type: string
    group_label: "Dados da Regional"
    label: "Regional - Original"
    description: "Indica a regional atribuida ao campus na data de inicio da proposta"
    sql: ${TABLE}."REGIONAL_ORIGINAL" ;;
  }

  dimension: release_contrato {
    type: number
    group_label: "Dados do Contrato"
    label: "Release do Contrato"
    description: "Indica o número de release do contrato do aluno"
    sql: ${TABLE}."RELEASE_CONTRATO" ;;
  }

  dimension: renda_familiar {
    type: number
    group_label: "Dados do Aluno"
    label: "Renda Familia"
    value_format: "0"
    description: "Indica o valor da renda familiar do aluno"
    sql: ${TABLE}."RENDA_FAMILIAR" ;;
    required_access_grants: [grupo_renda]
  }

  dimension: faixa_renda_familiar {
    type: tier
    tiers: [1000,2000,3000,4000,6000,8000,10000]
    style: integer
    sql: ${renda_familiar} ;;
    group_label: "Dados do Aluno"
    group_item_label: "Faixa de Renda Familia"
    description: "Indica a faixa de renda familiar do aluno"
  }

  dimension: representante_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Representante - Atual"
    description: "Indica o representante comercial atribuido ao campus atualmente"
    sql: ${TABLE}."REPRESENTANTE_ATUAL" ;;
  }

  dimension: representante_original {
    type: string
    group_label: "Dados da Regional"
    label: "Representante - Original"
    description: "Indica o representante comercial atribuido na data de inicio da proposta"
    sql: ${TABLE}."REPRESENTANTE_ORIGINAL" ;;
  }

  dimension: semestre_cursando {
    type: number
    group_label: "Dados do Aluno"
    label: "Semestre - Atual"
    description: "Indica o semestre atual do aluno"
    sql: ${TABLE}."SEMESTRE_CURSANDO" ;;
  }

  dimension: semestre_financiado {
    type: string
    group_label: "Dados do Contrato"
    label: "Semestre Financiado"
    description: "Indica o semestre financiado pelo aluno por contrato"
    sql: ${TABLE}."SEMESTRE_FINANCIADO" ;;
  }

  dimension: ticket_medio {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Ticket Médio"
    value_format: "$ #,##0.00"
    description: "Indica o valor da última mensalidade dividido pela quantidade de parcelas financiadas"
    sql: ${TABLE}."TICKET_MEDIO" ;;
  }



  dimension: tipo_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Tipo de Representante - Atual"
    description: "Indica se o representante atribuído ao campus atualmente é fixo ou volante"
    sql: ${TABLE}."TIPO_ATUAL" ;;
  }

  dimension: tipo_original {
    type: string
    group_label: "Dados da Regional"
    label: "Tipo de Representante - Original"
    description: "Indica se o representante atribuído ao campus na data de início da proposta era fixo ou volante"
    sql: ${TABLE}."TIPO_ORIGINAL" ;;
  }

  dimension: tipo_produto {
    type: string
    group_label: "Dados do Produto"
    label: "Tipo de Produto"
    description: "Indica se o produto do aluno é Core Business ou produto de Squad"
    suggestable: yes
    sql: ${TABLE}."TIPO_PRODUTO" ;;
  }

  dimension: tipo_proposta {
    type: string
    group_label: "Dados da Proposta"
    label: "Tipo de Proposta"
    description: "Indica se a proposta do aluno é Nova,Renovação, Renegociação, Segundo Repasse ou Reempactado"
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }

  dimension: tipo_renovacao {
    type: string
    group_label: "Dados de Renovação"
    label: "Tipo de Renovação"
    description: "Indica se a renovação é Ímpar ou Par"
    sql: ${TABLE}."TIPO_RENOVACAO" ;;
  }

  dimension: tx_anual_total {
    type: number
    group_label: "Dados do Contrato"
    label: "Taxa Anual"
    description: "Indica o valor da taxa de juros anual do contrato"
    sql: ${TABLE}."TX_ANUAL_TOTAL" ;;
    value_format: "0.00"
  }

  dimension: tx_mensal_aluno {
    type: number
    group_label: "Dados do Contrato"
    label: "Taxa Mensal - Aluno"
    description: "Indica o valor do juros mensal do contrato, descontando o valor subsiado pela instituição. "
    sql: IFNULL(${TABLE}."TX_MENSAL_ALUNO",0) ;;
    value_format: "0.00"
  }

  dimension: tx_mensal_total {
    type: number
    group_label: "Dados do Contrato"
    label: "Taxa Mensal"
    description: "Indica o valor da taxa de juros mensal do contrato"
    sql: ${TABLE}."TX_MENSAL_TOTAL" ;;
    value_format: "0.00"
  }

  dimension: uf_campus {
    type: string
    group_label: "Dados do Campus"
    label: "UF - Campus"
    description: "Indica a UF correspondente ao campus"
    sql: ${TABLE}."UF_CAMPUS" ;;
  }

  dimension: regiao_campus {
    type: string
    group_label: "Dados do Campus"
    label: "Região - Campus"
    description: "Indica a região geográfica do campus da faculdade"
    sql: case when ${uf_campus} in ('SP', 'RJ', 'MG', 'ES') THEN 'SUDESTE'
         when ${uf_campus} in ('DF', 'GO', 'MT', 'MS') THEN 'CENTRO-OESTE'
         WHEN ${uf_campus} IN ('AC', 'AM', 'RO', 'RR', 'PA', 'AP', 'TO') then 'NORTE'
         WHEN ${uf_campus} IN ('MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA') then 'NORDESTE'
         WHEN ${uf_campus} IN ('PR', 'SC', 'RS') then 'SUL'
         ELSE 'NÃO PREENCHIDO' END ;;
  }

  dimension: uf_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "UF - Instituição"
    description: "Indica a UF correspondente à instituição"
    sql: ${TABLE}."UF_INSTITUICAO" ;;
  }

  dimension: vl_comissao_ideal {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor - Comissão PRAVALER"
    description: "Indica o valor da comissão do pravaler por contrato."
    value_format_name: id
    hidden: yes
    sql: ${TABLE}."VL_COMISSAO_IDEAL" ;;
  }

  dimension: vl_dias_wo_ies {
    type: number
    group_label: "Dados da Instituição"
    label: "Dias no W.O"
    description: "Indica a quantidade de dias que a instituição entrou no WriteOff."
    sql: ${TABLE}."VL_DIAS_WO_IES" ;;
  }

  dimension: vl_financiado {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor Financiado"
    value_format: "0"
    description: "Indica o valor financiado pelo aluno."
    hidden: yes
    sql: ${TABLE}."VL_FINANCIADO" ;;
  }

  dimension: vl_financiamento {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor do Financiamento"
    value_format: "$ #,###.00"
    description: "Indica o valor total do financiamento do contrato"
    sql: ${TABLE}."VL_FINANCIAMENTO" ;;
  }

  dimension: vl_financiamento_aluno {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor do Financiamento - Aluno "
    value_format: "$ #,###.00"
    description: "Indica a quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno "
    sql: ${TABLE}."VL_FINANCIAMENTO_ALUNO" ;;
  }

  dimension: vl_iof {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor IOF "
    value_format: "0"
    description: "Indica o valor de IOF aplicado ao contrato "
    sql: ${TABLE}."VL_IOF" ;;
  }

  dimension: vl_men_corrente {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Mensalidade Atual "
    value_format: "0"
    description: "Indica o valor da mensalidade atual do aluno"
    sql: ${TABLE}."VL_MEN_CORRENTE" ;;
  }

  dimension: vl_mensalidade {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Mensalidade"
    value_format: "$ #,###.00"
    description: "Indica o valor da mensalidade descrita no contrato"
    sql: IFNULL(${TABLE}."VL_MENSALIDADE",0) ;;
  }

  dimension: vl_parcela {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor da Parcela"
    value_format: "0"
    description: "Indica o valor da parcela do contrato."
    hidden: yes
    sql: ${TABLE}."VL_PARCELA" ;;
  }

  dimension: vl_prestacoes {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Prestação"
    value_format: "$ #,###.00"
    description: "Indica o valor da prestação do contrato"
    sql: ${TABLE}."VL_PRESTACOES" ;;
  }

  dimension: vl_principal {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor Principal"
    value_format: "0"
    description: "Indica o valor principal do contrato."

    sql: ${TABLE}."VL_PRINCIPAL" ;;
  }

  dimension: vl_principal_original {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor Principal Original"
    value_format: "0"
    description: "Indica o valor principal original do contrato."
    sql: ${TABLE}."VALOR_PRINCIPAL_ORIGINAL" ;;
  }

  dimension: vl_rematricula {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Rematricula"
    value_format: "0"
    description: "Indica o valor da rematricula do aluno por contrato"
    sql: ${TABLE}."VL_REMATRICULA" ;;
  }

  dimension: vl_repasse_ies {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor Repasse - Instituição"
    value_format: "0"
    description: "Indica o valor de repasse a instituição de ensino por contrato"
    hidden: yes
    sql: ${TABLE}."VL_REPASSE_IES" ;;
  }

  dimension: vl_score {
    type: number
    group_label: "Dados do Aluno"
    label: "Score"
    description: "Indica o valor de Score do aluno"
    sql: ${TABLE}."VL_SCORE" ;;
    value_format: "0"
  }

  dimension: vl_subsidiado {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor Subsidiado"
    value_format: "0"
    description: "Indica o valor subsidiado para o originador BV (Banco Votorantim) por contrato"

    sql: ${TABLE}."VL_SUBSIDIADO" ;;
  }

  dimension: vl_tarifa_cadastro {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Tarifa de Cadastro"
    value_format: "0"
    description: "Indica o valor da tarifa de cadastro do contrato"
    sql: ${TABLE}."VL_TARIFA_CADASTRO" ;;
  }

  dimension: vl_tarifa_parcela {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Tarifa de Cadastro - Parcela"
    value_format: "0"
    description: "Indica o valor da parcela da tarifa de cadastro"
    sql: ${TABLE}."VL_TARIFA_PARCELA" ;;
  }

  dimension: vl_total_financiado_bv {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor Financiado - BV "
    value_format: "0"
    description: "Indica o valor total financiado + valor de IOF da BV. "
    sql: ${TABLE}."VL_TOTAL_FINANCIADO_BV" ;;
  }


  dimension: juros_total {
    type: number
    group_label: "Valores Cessão"
    group_item_label: "Juros Total"
    sql: CASE WHEN
           ${vl_financiamento_aluno}-${vl_financiamento} > 1
          THEN ${vl_financiamento_aluno}-${vl_financiamento}
          ELSE (${vl_financiamento} - (${vl_repasse_ies} + ${vl_comissao_ideal}))
          END;;
    description:  "Indica a soma do valor do juros total do contrato do aluno"
    hidden: yes
    value_format: "$ #,###.00"
  }


  dimension: juros_aluno {
    type: number
    group_label: "Dados do Contrato"
    group_item_label: "Valor - Juros do Aluno"
    sql: ${juros_total} -  (${vl_financiamento} - (${vl_repasse_ies} + ${vl_comissao_ideal}));;
    description:  "Indica a soma do valor do juros total do contrato do aluno"
    hidden: yes
    value_format: "$ #,###.00"
  }






  dimension: vl_ult_status {
    type: string
    group_label: "Jornada"
    label: "ID Último Status"
    description: "Indica o ID do Último Status da Proposta ."
    sql: ${TABLE}."VL_ULT_STATUS" ;;
  }

  dimension: classe_modelo_iniciado {
    type: string
    group_label: "Dados da Proposta"
    group_item_label: "Classe - Modelo Iniciados"
    description: "Classificação do aluno de acordo com o seu potencial de conversão"
    sql: ${TABLE}."CLASSE_MODELO_INICIADO" ;;
  }

  dimension: estado_civil_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Estado Civil"
    description: "Indica o estado civil do aluno"
    sql: ${TABLE}."ESTADO_CIVIL_ALUNO" ;;
  }

  dimension: reside_qtd_pessoas_aluno {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "Quantidade de Pessoas na Residência"
    description: "Informa a quantidade de pessoas que mora na mesma residência que o aluno"
    sql: ${TABLE}."RESID_QTD_PESSOAS_ALUNO" ;;
  }

  dimension: tipo_residencia_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Tipo de Residência"
    description: "Indica o tipo de residencia que o aluno mora (EX. Aluguel, Propria, Financiada, Quitada)"
    sql: ${TABLE}."TIPO_RESIDENCIA_ALUNO" ;;
  }

  dimension: estado_civil_fia {
    type: string
    group_label: "Dados do Fiador"
    group_item_label: "Estado Civil"
    description: "Indica o estado civil do fiador"
    sql: ${TABLE}."ESTADO_CIVIL_FIADOR" ;;
  }


  dimension: profissao_garantidor {
    type: string
    group_label: "Dados do Fiador"
    group_item_label: "Ocupação"
    description: "Indica a ocupação/profissão do fiador"
    sql: ${TABLE}."PROFISSAO_GARANTIDOR" ;;
  }

  dimension: reside_qtd_pessoas_fia {
    type: number
    group_label: "Dados do Fiador"
    group_item_label: "Quantidade de Pessoas na Residência"
    description: "Informa a quantidade de pessoas que mora na mesma residência que o fiador"
    sql: ${TABLE}."RESID_QTD_PESSOAS_FIADOR" ;;
  }

    dimension: tipo_residencia_fia {
      type: string
      group_label: "Dados do Fiador"
      group_item_label: "Tipo de Residência"
      description: "Indica o tipo de residencia que o fiador mora (EX. Aluguel, Propria, Financiada, Quitada)"
      sql: ${TABLE}."TIPO_RESIDENCIA_FIADOR" ;;
    }

  dimension: fia_parentesco {
    type: string
    group_label: "Dados do Fiador"
    group_item_label: "Parentesco"
    description: "Indica o tipo de parentesco que o fiador tem com o aluno (EX Pai, Mae, Irmão, Conjuge)"
    sql: ${TABLE}."FIA_PARENTESCO" ;;
  }

  dimension: reside_com{
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Mora com quem"
    description: "Indica quem são as pessoas que moram na mesma residência que o aluno"
    sql: ${TABLE}."RESIDE_COM" ;;
  }

  dimension: flg_mora_fiador{
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Reside com o Fiador"
    description: "Indica se aluno e fiador moram na mesma residencia"
    sql: ${TABLE}."FLG_MORA_FIADOR" ;;
    hidden: yes
  }

  dimension: mora_com_fiador {
    case: {
      when: {
        sql: ${flg_mora_fiador} = false ;;
        label: "Não"
      }
      else: "Sim"
    }
    group_label: "Dados do Aluno"
    group_item_label: "Reside com o Fiador"
    description: "Indica se aluno e fiador moram na mesma residencia"
  }


  dimension: flg_primeira_contratacao{
    type: yesno
    group_label: "Dados de Renovação"
    group_item_label: "Primeira Recontratação?"
    description: "Indica se é a primeira recontratação de renovação do aluno dentro do semestre financiado. "
    sql: ${TABLE}."FLG_PRIMEIRA_CONTRATACAO" ;;
  }


  dimension: flg_primeira_contratacao_status{
    type: yesno
    group_label: "Dados de Renovação"
    group_item_label: "Primeira Recontratação Ciclo?"
    description: "Indica se é a primeira recontratação de renovação do aluno dentro do CICLO.(Renovação + Ciclo)"
    sql: ${TABLE}."FLG_PRIMEIRA_CONTRATACAO_STATUS" ;;
  }

  dimension: projeto{
    type: string
    group_label: "Dados do Produto"
    group_item_label: "Projeto"
    description: "Indica o projeto que a proposta pertentece. EX: P-FIES, KROTON"
    sql: ${TABLE}."PROJETO" ;;
  }

  dimension_group: data_formalizacao_prevista {
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
    label: "Formalização Prevista"
    sql: ${TABLE}."DATA_FORMALIZACAO_PREVISTA" ;;
  }

  dimension: flg_cancelado {
    type: yesno
    group_label: "Dados da Proposta"
    label: "Proposta Cancelada?"
    description: "Indica se a proposta está cancelada ou não"
    sql: ${TABLE}."FLG_CANCELADO" ;;
  }

  measure: count_proposta {
    type: count
    group_label: "Proposta"
    group_item_label: "Quantidade de Propostas"
    description: "Contagem de Propostas"
    drill_fields: []
    value_format: "0"
  }

  measure: cont_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    value_format: "0"
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de CPFs únicos"
    drill_fields: [
      cpf_aluno,
      id_cpf,
      id_proposta,
      ds_fundo_investimento,
      grupo_instituicao,
      ds_instituicao,
      area_conhecimento_curso,
      nm_modalidade_produto,
      nm_produto,
      tx_mensal_total,
      tx_anual_total,
      perc_tx_subsidiado_ies,
      vl_subsidiado,
      sum_juros_pago_ies,
      sum_juros_subsidiado,
      tipo_proposta
    ]
  }





  measure: perc_cpf {
    type: percent_of_total
    sql: ${cont_cpf} ;;
    direction: "column"
    group_label: "Quantidade de Alunos"
    group_item_label: "Porcentagem"

  }



  measure: sum_vl_cet_aa  {
    type: sum
    group_label: "Custo Efetivo Total"
    group_item_label: "Soma A.A"
    sql:${cet_aa};;
    description: "Soma do valor do custo efetivo Total ao ano do contrato"
  }

  measure: avg_vl_cet_aa  {
    type: average
    group_label: "Custo Efetivo Total"
    group_item_label: "Média A.A"
    sql:${cet_aa};;
    description: "Média do valor dp custo efetivo Total ao ano do contrato"
  }

  measure: min_vl_cet_aa  {
    type: min
    group_label: "Custo Efetivo Total"
    group_item_label: "Mínimo A.A"
    sql:${cet_aa};;
    description: "Mínimo do valor do  custo efetivo Total ao ano do contrato"
  }


  measure: max_vl_cet_aa  {
    type: max
    group_label: "Custo Efetivo Total"
    group_item_label: "Máximo A.A"
    sql:${cet_aa};;
    description: "Máximo do valor do custo efetivo Total ao ano do contrato"
  }


  measure: sum_vl_cet_am  {
    type: sum
    group_label: "Custo Efetivo Total"
    group_item_label: "Soma A.M"
    sql:${cet_am};;
    description: "Soma do valor do custo efetivo Total ao mês do contrato"
  }

  measure: avg_vl_cet_am  {
    type: average
    group_label: "Custo Efetivo Total"
    group_item_label: "Média A.M"
    sql:${cet_am};;
    description: "Média do valor do custo efetivo Total ao mês do contrato"
  }

  measure: min_vl_cet_am  {
    type: min
    group_label: "Custo Efetivo Total"
    group_item_label: "Mínimo A.M"
    sql:${cet_am};;
    description: "Mínimo do valor do custo efetivo Total ao mês do contrato"
  }


  measure: max_vl_cet_am  {
    type: max
    group_label: "Custo Efetivo Total"
    group_item_label: "Máximo A.M"
    sql:${cet_am};;
    description: "Máximo do valor do custo efetivo Total ao mês do contrato"
  }


  measure: sum_vl_financiamento {
    type: sum
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Soma"
    sql:${vl_financiamento};;
    description: "Soma do valor total do financiamento do contrato"
  }

  measure: avg_vl_financiamento  {
    type: average
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Média"
    sql:${vl_financiamento};;
    description: "Média do valor total do financiamento do contrato"
  }

  measure: min_vl_financiamento {
    type: min
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Mínimo"
    sql:${vl_financiamento};;
    description: "Mínimo do valor total do financiamento do contrato"
  }


  measure: max_vl_financiamento  {
    type: max
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Máximo"
    sql:${vl_financiamento};;
    description: "Máximo do valor total do financiamento do contrato"
  }




  measure: sum_vl_financiamento_aluno {
    type: sum
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Aluno - Soma"
    sql:${vl_financiamento_aluno};;
    description: "Soma do valor da quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno"
  }

  measure: avg_vl_financiamento_aluno  {
    type: average
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Aluno - Média"
    sql:${vl_financiamento_aluno};;
    description: "Média do valor da quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno"
  }

  measure: min_vl_financiamento_aluno {
    type: min
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Aluno - Mínimo"
    sql:${vl_financiamento_aluno};;
    description: "Mínimo do valor da quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno"
  }


  measure: max_vl_financiamento_aluno  {
    type: max
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Aluno - Máximo"
    sql:${vl_financiamento_aluno};;

    description: "Máximo do valor da quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno"
  }

  measure: median_vl_financiamento_aluno {
    type: median
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Aluno - Mediana"
    sql:${vl_financiamento_aluno};;

    description: "Mediana do valor da quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno"

  }

  measure: perc1_vl_financiamento_aluno {
    type: percentile
    percentile: 25
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Aluno - Primeiro Quartil"
    sql:${vl_financiamento_aluno};;

    description: "Primeiro quartil do valor da quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno"

  }

  measure: perc3_vl_financiamento_aluno {
    type: percentile
    percentile: 75
    group_label: "Financiamento"
    value_format: "$ #,###.00"
    group_item_label: "Aluno - Terceiro Quartil"
    sql:${vl_financiamento_aluno};;

    description: "Terceiro quartil do valor da quantidade de prestações multiplicada ao valor das parcelas do contrato do aluno"

  }



  measure: sum_iof {
    type: sum
    group_label: "IOF"
    group_item_label: "Soma"
    sql:${vl_iof};;
    description: "Soma do valor IOF aplicado ao contrato"
  }

  measure: avg_iof  {
    type: average
    group_label: "IOF"
    group_item_label: "Média"
    sql:${vl_iof};;
    description: "Média do valor IOF aplicado ao contrato"
  }

  measure: min_iof {
    type: min
    group_label: "IOF"
    group_item_label: "Mínimo"
    sql:${vl_iof};;
    description: "Mínimo do valor IOF aplicado ao contrato"
  }


  measure: max_iof  {
    type: max
    group_label: "IOF"
    group_item_label: "Máximo"
    sql:${vl_iof};;
    description: "Máximo do valor IOF aplicado ao contrato"
  }


  measure: sum_mensalidade_atual {
    type: sum
    group_label: "Mensalidade - Atual"
    value_format: "0"
    group_item_label: "Soma"
    sql:${vl_men_corrente};;
    description: "Soma do valor da mensalidade atual do aluno"
  }


  measure: avg_mensalidade_atual  {
    type: average
    group_label: "Mensalidade - Atual"
    value_format: "0"
    group_item_label: "Média"
    sql:${vl_men_corrente};;
    description: "Média do valor da mensalidade atual do aluno"
  }

  measure: min_mensalidade_atual {
    type: min
    group_label: "Mensalidade - Atual"
    value_format: "0"
    group_item_label: "Mínimo"
    sql:${vl_men_corrente};;
    description: "Mínimo do valor da mensalidade atual do aluno"
  }


  measure: max_mensalidade_atual  {
    type: max
    group_label: "Mensalidade - Atual"
    value_format: "0"
    group_item_label: "Máximo"
    sql:${vl_men_corrente};;
    description: "Máximo do valor da mensalidade atual do aluno"
  }

  measure: sum_qtd_mensalidade_atual {
    type: sum
    group_label: "Mensalidade - Atual"
    group_item_label: "Quantidade de Mensalidades"
    sql:${qtd_men_corrente};;
    value_format: "0"
    description: "Soma da quantidade de mensalidades por contrato do semestre atual"
  }

  measure: avg_qtd_mensalidade_atual {
    type: average
    group_label: "Mensalidade - Atual"
    group_item_label: "Quantidade de Mensalidades - Média"
    sql:${qtd_men_corrente};;
    value_format: "0"
    description: "Média da quantidade de mensalidades por contrato do semestre atual"
  }

  measure: min_qtd_mensalidade_atual {
    type: min
    group_label: "Mensalidade - Atual"
    group_item_label: "Quantidade de Mensalidades - Mínimo"
    sql:${qtd_men_corrente};;
    value_format: "0"
    description: "Mínimo da quantidade de mensalidades por contrato do semestre atual"
  }

  measure: max_qtd_mensalidade_atual {
    type: max
    group_label: "Mensalidade - Atual"
    group_item_label: "Quantidade de Mensalidades - Máximo"
    sql:${qtd_men_corrente};;
    value_format: "0"
    description: "Máximo da quantidade de mensalidades por contrato do semestre atual"
  }


  measure: sum_mensalidade_contrato {
    type: sum
    group_label: "Mensalidade"
    value_format: "$ #,###.00"
    group_item_label: "Soma"
    sql:${vl_mensalidade};;
    description: "Soma do valor da mensalidade descrita no contrato"
  }

  measure: avg_mensalidade_contrato  {
    type: average
    group_label: "Mensalidade"
    value_format: "$ #,###.00"
    group_item_label: "Média"
    sql:${vl_mensalidade};;
    description: "Média do valor da mensalidade descrita no contrato"
  }

  measure: min_mensalidade_contrato {
    type: min
    group_label: "Mensalidade"
    value_format: "$ #,###.00"
    group_item_label: "Mínimo"
    sql:${vl_mensalidade};;
    description: "Mínimo do valor da mensalidade descrita no contrato"
  }


  measure: max_mensalidade_contrato  {
    type: max
    group_label: "Mensalidade"
    value_format: "$ #,###.00"
    group_item_label: "Máximo"
    sql:${vl_mensalidade};;
    description: "Máximo do valor da mensalidade descrita no contrato"
  }

  measure: median_mensalidade_contrato  {
    type: median
    group_label: "Mensalidade"
    value_format: "$ #,###.00"
    group_item_label: "Mediana"
    sql:${vl_mensalidade};;
    description: "Mediana do valor da mensalidade descrita no contrato"
  }

  measure: perc1_mensalidade_contrato  {
    type: percentile
    percentile: 25
    group_label: "Mensalidade"
    value_format: "$ #,###.00"
    group_item_label: "Primeiro quartil"
    sql:${vl_mensalidade};;
    description: "Primeiro quartil do valor da mensalidade descrita no contrato"
  }

  measure: perc3_mensalidade_contrato  {
    type: percentile
    percentile: 75
    group_label: "Mensalidade"
    value_format: "$ #,###.00"
    group_item_label: "Terceiro quartil"
    sql:${vl_mensalidade};;
    description: "Terceiro quartil do valor da mensalidade descrita no contrato"
  }

  measure: sum_qtd_mensalidade_contrato {
    type: sum
    group_label: "Mensalidade"
    group_item_label: "Quantidade de Mensalidades"
    sql:${qtd_mensalidades};;
    value_format: "0"
    description: "Soma da quantidade de mensalidades por contrato"
  }

  measure: avg_qtd_mensalidade_contrato  {
    type: average
    group_label: "Mensalidade"
    group_item_label: "Quantidade de Mensalidades - Média"
    sql:${qtd_mensalidades};;
    value_format: "0"
    description: "Média da quantidade de mensalidades por contrato"
  }

  measure: min_qtd_mensalidade_contrato {
    type: min
    group_label: "Mensalidade"
    group_item_label: "Quantidade de Mensalidades - Mínimo"
    sql:${qtd_mensalidades};;
    value_format: "0"
    description: "Mínimo da quantidade de mensalidades por contrato"
  }


  measure: max_qtd_mensalidade_contrato  {
    type: max
    group_label: "Mensalidade"
    group_item_label: "Quantidade de Mensalidades - Máximo"
    sql:${qtd_mensalidades};;
    value_format: "0"
    description: "Máximo da quantidade de mensalidades por contrato"
  }


  measure: sum_vl_prestacoes {
    type: sum
    group_label: "Prestações"
    group_item_label: "Soma"
    value_format: "0"
    sql:${vl_prestacoes};;
    description: "Soma do valor das prestações do contrato"
  }

  measure: avg_vl_prestacoes  {
    type: average
    group_label: "Prestações"
    group_item_label: "Média"
    value_format: "0"
    sql:${vl_prestacoes};;
    description: "Média do valor das prestações do contrato"
  }

  measure: min_vl_prestacoes {
    type: min
    group_label: "Prestações"
    group_item_label: "Mínimo"
    value_format: "0"
    sql:${vl_prestacoes};;
    description: "Mínimo do valor das prestações do contrato"
  }


  measure: max_vl_prestacoes  {
    type: max
    group_label: "Prestações"
    group_item_label: "Máximo"
    value_format: "0"
    sql:${vl_prestacoes};;
    description: "Máximo o valor das prestações do contrato"
  }

  measure: sum_qtd_prestacoes {
    type: sum
    group_label: "Prestações"
    group_item_label: "Quantidade de Prestações"
    sql:${qtd_prestacoes};;
    value_format: "0"
    description: "Soma da quantidade de prestações do contrato"
  }

  measure: avg_qtd_prestacoes  {
    type: average
    group_label: "Prestações"
    group_item_label: "Quantidade de Prestações - Média"
    sql:${qtd_prestacoes};;
    value_format: "0"
    description: "Média da quantidade de prestações do contrato"
  }

  measure: min_qtd_prestacoes {
    type: min
    group_label: "Prestações"
    group_item_label: "Quantidade de Prestações - Mínimo"
    sql:${qtd_prestacoes};;
    value_format: "0"
    description: "Mínimo da quantidade de prestações do contrato"
  }


  measure: max_qtd_prestacoes  {
    type: max
    group_label: "Prestações"
    group_item_label: "Quantidade de Prestações - Máximo"
    sql:${qtd_prestacoes};;
    value_format: "0"
    description: "Máximo da quantidade de prestações do contrato"
  }

  measure: sum_vl_rematricula {
    type: sum
    group_label: "Rematricula"
    value_format: "$ #,###.00"
    sql:${vl_rematricula};;
    description: "Soma do valor da rematricula do aluno por contrato"
  }

  measure: avg_vl_rematricula  {
    type: average
    group_label: "Rematricula"
    group_item_label: "Média"
    value_format: "$ #,###.00"
    sql:${vl_rematricula};;
    description: "Média do valor da rematricula do aluno por contrato"
  }

  measure: min_vl_rematricula {
    type: min
    group_label: "Rematricula"
    group_item_label: "Mínimo"
    value_format: "$ #,###.00"
    sql:${vl_rematricula};;

    description: "Mínimo do valor da rematricula do aluno por contrato"
  }


  measure: max_vl_rematricula  {
    type: max
    group_label: "Rematricula"
    group_item_label: "Máximo"
    sql:${vl_rematricula};;
    value_format: "$ #,###.00"
    description: "Máximo do valor da rematricula do aluno por contrato"
  }

  measure: sum_taxa_mensal {
    type: sum
    group_label: "Taxa"
    group_item_label: "Taxa Mensal"
    sql:${tx_mensal_total};;
    value_format: "$ #,###.00"
    description: "Soma do valor da taxa mensal do contrato"
  }

  measure: sum_taxa_mensal_aluno {
    type: sum
    group_label: "Taxa"
    group_item_label: "Taxa Mensal - Aluno"
    sql:${tx_mensal_aluno};;
    description: "Soma do valor do juros mensal do contrato, descontando o valor subsiado pela instituição"
  }


  measure: avg_taxa_mensal_aluno {
    type: average
    group_label: "Taxa"
    group_item_label: "Taxa Mensal - Aluno | Média"
    sql:${tx_mensal_aluno};;
    description: "Média do valor do juros mensal do contrato, descontando o valor subsiado pela instituição"
  }


  measure: sum_taxa_anual {
    type: sum
    group_label: "Taxa"
    group_item_label: "Taxa Anual"
    sql:${tx_anual_total};;
    description: "Soma do valor da taxa anual do contrato"
  }


  measure: sum_ticket_medio {
    type: sum
    group_label: "Ticket Médio"
    group_item_label: "Soma"
    value_format: "0"
    sql:${ticket_medio};;
    description: "Soma do ticket médio do contrato"
  }


  measure: avg_ticket_medio  {
    type: average
    group_label: "Ticket Médio"
    group_item_label: "Média"
    value_format: "0"
    sql:${ticket_medio};;
    description: "Média do valor do ticket médio do contrato"
  }

  measure: min_ticket_medio {
    type: min
    group_label: "Ticket Médio"
    group_item_label: "Mínimo"
    value_format: "0"
    sql:${ticket_medio};;
    description: "Mínimo do valor do ticket médio do contrato"
  }


  measure: max_ticket_medio  {
    type: max
    group_label: "Ticket Médio"
    group_item_label: "Máximo"
    value_format: "0"
    sql:${ticket_medio};;
    description: "Máximo do valor do ticket médio do contrato"
  }


  measure: sum_qtd_contratos_anteriores {
    type: sum
    group_label: "Proposta"
    group_item_label: "Quantidade de Contratos Anteriores"
    sql:${qtd_contratos_anteriores};;
    value_format: "0"
    description: "Soma da quantidade contratos anteriores por proposta"
  }


  measure: count_tipo_proposta_novo {
    type: count_distinct
    sql:   CASE WHEN ${tipo_proposta} = 'NOVO'
       THEN ${id_proposta}
       ELSE NULL
       END  ;;
    group_label: "Proposta"
    group_item_label: "Novo"
    description: "Contagem de propostas de aluno novo"
    }


  measure: count_tipo_proposta_renovacao {
    type: count_distinct
    sql:   CASE WHEN ${tipo_proposta} = 'RENOVACAO'
       THEN ${id_proposta}
       ELSE NULL
       END;;
    group_label: "Proposta"
    group_item_label: "Renovação"
    description: "Contagem de propostas de renovação"
  }

  measure: count_tipo_proposta_seg_repasse {
    type: count_distinct
    group_label: "Proposta"
    group_item_label: "Segundo Repasse"
    sql:   CASE WHEN ${tipo_proposta} = 'SEGUNDO REPASSE'
    THEN ${id_proposta}
    ELSE NULL
    END;;
    description: "Contagem de propostas de segundo repasse"
  }

  measure: count_tipo_proposta_renegociacao {
    type: count_distinct
    group_label: "Proposta"
    group_item_label:  "Renegociação"
    sql:   CASE WHEN ${tipo_proposta} = 'RENEGOCIACAO'
    THEN ${id_proposta}
    ELSE NULL
    END;;
    description: "Contagem de propostas de renegociação"
  }

  measure: count_tipo_proposta_reempacotado {
    type: count_distinct
    group_label: "Proposta"
    group_item_label: "Reempacotado"
    sql:   CASE WHEN ${tipo_proposta} = 'REEMPACOTADO'
    THEN ${id_proposta}
    ELSE NULL
    END;;
    description: "Contagem de propostas do tipo reempactado"
  }



  measure: count_contrato_gerado {
    type: count_distinct
    group_label: "Contrato"
    sql_distinct_key: ${id_proposta} ;;
    group_item_label: "Quantidade de Contratos Gerados"
    sql:${id_proposta};;
    filters: [flg_contrato_gerado: "yes"]
    description: "Soma da quantidade de contratos gerados"
  }

  measure: count_financiou_matricula{
    type: count_distinct
    group_label: "Contrato"
    sql_distinct_key: ${id_proposta} ;;
    group_item_label: "Quantidade de Contratos - Financiou Matricula"
    sql:${id_proposta};;
    filters: [flg_financia_matricula_rnv: "yes"]
    description: "Soma da quantidade de contratos de alunos que financiaram a matricula"
  }


  measure: count_boleto_atrasado{
    type: count_distinct
    group_label: "Contrato"
    sql_distinct_key: ${renovou_proximo_ciclo} ;;
    group_item_label: "Quantidade de Contratos - Boletos Atrasados"
    sql:${id_proposta};;
    filters: [flg_boleto_atrasado: "yes"]
    description: "Soma da quantidade de contratos de alunos com boleto atrasado"
  }

  measure: sum_repasse {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Repasse - Soma"
    sql:${vl_repasse_ies};;
    value_format: "$ #,###.00"
    description: "Soma do valor repassado para as IES"
  }

  measure: avg_repasse {
    type: average
    group_label: "Valores Cessão"
    group_item_label: "Repasse - Média"
    sql:${vl_repasse_ies};;
    description: "Valor médio repassado para as IES"
    value_format: "0"
  }

  measure: sum_comissao {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Comissão - Soma"
    sql:${vl_comissao_ideal};;
    description:  "Indica o valor de comissão paga ao Pravaler por produto contratado"
    value_format: "0"
  }

  measure: avg_comissao {
    type: average
    group_label: "Valores Cessão"
    group_item_label: "Comissão - Média"
    sql:${vl_comissao_ideal};;
    description:  "Indica o valor médio de comissão paga ao Pravaler por produto contratado"
    value_format: "0"
  }

  measure: sum_desagio {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Desagio - Soma"
    sql:${vl_financiamento} - ${vl_repasse_ies};;
    description: "Soma de valor do Desagio (Comissão + Juros)"
    value_format: "0"
  }

  measure: sum_perc_desagio {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Desagio % - Soma"
    sql: ${vl_repasse_ies} / ${vl_financiamento};;
    description: "Soma de valor do Desagio % "
  }

  measure: avg_perc_comissao {
    type: average
    group_label: "Valores Cessão"
    group_item_label: "Comissão % - Média"
    sql:${perc_comissao};;
    description: "Indica a porcentagem média de comissão paga ao Pravaler por produto contratado"
  }


  measure: avg_desagio {
    type: average
    group_label: "Valores Cessão"
    group_item_label: "Desagio % - Média"
    sql:${perc_desagio};;
    description: "Valor percentual médio do Desagio (Comissão + Juros)"
    value_format: "0"
  }

  measure: sum_tarifa_cadastro {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Tarifa Cadastro - Soma"
    sql:${vl_tarifa_cadastro};;
    description:  "Indica a soma do valor da tarifa de cadastro do contrato"
    value_format: "0"
  }

  measure: sum_juros_pago_ies {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Juros Ies - Soma"
    sql: ((${vl_financiamento} - ${vl_repasse_ies}) - ${vl_comissao_ideal}) * ${perc_tx_subsidiado_ies} ;;
    description:  "Indica a soma dos juros pagos pela Instituição"
    hidden: yes
    value_format: "$ #,###.00"
  }

  measure: sum_juros_subsidiado {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Juros Subsidiado - Soma"
    sql: (${vl_financiamento} - (${vl_repasse_ies} + ${vl_comissao_ideal})) ;;
    description:  "Indica a soma do valor do juros subsidiado pela IES do contrato"
    value_format: "$ #,###.00"
  }









  measure: sum_juros_total {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Juros Total - Soma"
    sql: ${juros_total}  ;;
    description:  "Indica a soma do valor do juros total do contrato do aluno"
    value_format: "$ #,###.00"
  }

  measure: sum_juros_aluno {
    type: number
    group_label: "Valores Cessão"
    group_item_label: "Juros Aluno - Soma"
    sql: CASE WHEN
         ${sum_juros_total}-${sum_juros_subsidiado} < 0
        THEN 0
        ELSE  ${sum_juros_total}-${sum_juros_subsidiado}
        END;;
    description:  "Indica a soma do valor do juros pago pelo aluno"
    value_format: "$ #,###.00"
  }












  measure: somarprodutocomissao {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: ""
    sql: ${vl_financiamento} * ${perc_comissao} ;;
    description: "Valor Financiamento * Comissão Percentual"
    hidden: yes
  }

  measure: comissao_media_ponderada{
    type: number
    group_label: "Valores Cessão"
    group_item_label: "Comissão - Média % Ponderada"
    description: "Valor percentual da comissão média ponderada da Cessão"
    sql: (NULLIF(${somarprodutocomissao},0) / NULLIF(${sum_vl_financiamento},0)) * 100;;
    value_format: "0.00\%"
  }

  measure: somarprodutotaxa {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: ""
    sql: ${vl_financiamento} * ${tx_mensal_total} ;;
    description: "Valor Financiamento * Comissão Percentual"
    hidden: yes
  }

  measure: taxa_media_ponderada{
    type: number
    group_label: "Valores Cessão"
    group_item_label: "Taxa - Média % Ponderada"
    description: "Valor percentual da taxa média ponderada da Cessão"
    sql: NULLIF(${somarprodutotaxa},0) / NULLIF(${sum_vl_financiamento},0);;
    value_format: "0.00\%"
  }

  measure: sum_custo_originacao {
    type: sum
    group_label: "Valores Cessão"
    group_item_label: "Custo de Originação - Soma"
    sql: ${custo_originacao} ;;
    description: "Indica o valor de originação do  contrato"
    value_format: "0"
  }

  measure: sum_receita_corban {
    type: sum
    group_label: "Valores Cessão"
    label:"Receita do Correspondente Bancário"
    description:"Indica valor da taxa paga por originador para cada boleto gerado."
    sql: ${TABLE}."RECEITA_CORBAN" ;;
    value_format: "0"
  }

  measure: sum_custo_total_cessao{
    type: number
    group_label: "Valores Cessão"
    group_item_label: "Custo Total Cessão - Soma"
    sql: ${sum_comissao} + ${sum_repasse} + ${sum_iof} + ${sum_tarifa_cadastro} + ${sum_custo_originacao} ;;
    description: "Indica o custo total da cessão (Comissão ideal + IOF + Repasse IES + Tarifa Cadastro + Custo de Originacao"
    value_format: "0"
  }


  measure: count_contratos_cedidos{
    type: count_distinct
    group_label: "Contrato"
    sql_distinct_key: ${id_proposta} ;;
    group_item_label: "Quantidade de Contratos - Cedidos"
    sql:${id_proposta};;
    filters: [flg_contrato_cedido:"yes"
              ]
    drill_fields: [id_cpf, id_proposta,id_produto,qtd_prestacoes,semestre_financiado,nm_produto,nm_modalidade_produto,flg_produto_ativo,flg_contrato_ativo,flg_contrato_cedido,data_concessao_date,id_contrato_conjunto,tipo_proposta,perc_tx_subsidiado_ies,perc_desagio,tx_mensal_total,tx_mensal_aluno,tx_anual_total,vl_financiado,sum_vl_financiamento]
    description: "Soma da quantidade de contratos cedidos"
  }


  measure: sum_renda_fam {
    type: sum
    sql: ${renda_familiar} ;;
    value_format: "$ #,###.00"
    group_label: "Renda Familiar"
    group_item_label: "Soma"
    description: "Soma da renda familiar"
    required_access_grants: [grupo_renda]
  }

  measure: avg_renda_fam {
    type: average
    sql: ${renda_familiar} ;;
    value_format: "$ #,###.00"
    group_label: "Renda Familiar"
    group_item_label: "Média"
    description: "Média da renda familiar"
    required_access_grants: [grupo_renda]
  }

  measure: sum_renda_fiador {
    type: sum
    sql: ${fia_renda} ;;
    drill_fields: [id_cpf, aluno_nome, id_fia_cpf, fia_nome, aluno_email, fia_email ]
    value_format: "$ #,###.00"
    group_label: "Renda Fiador"
    group_item_label: "Soma"
    description: "Soma da renda do Fiador"
    required_access_grants: [grupo_renda]
  }

  measure: avg_renda_fiador {
    type: average
    sql: ${fia_renda} ;;
    drill_fields: [id_cpf, aluno_nome, id_fia_cpf, fia_nome, aluno_email, fia_email, fia_parentesco ]
    value_format: "$ #,###.00"
    group_label: "Renda Fiador"
    group_item_label: "Média"
    description: "Média da renda do Fiador"
    required_access_grants: [grupo_renda]
  }

  measure: sum_renda_aluno {
    type: sum
    sql: ${aluno_renda} ;;
    drill_fields: [id_proposta,
          id_cpf,
          aluno_nome,
          aluno_email,
          tipo_proposta]
    value_format: "$ #,###.00"
    group_label: "Renda Aluno"
    group_item_label: "Soma"
    description: "Soma da renda do aluno"
    required_access_grants: [grupo_renda]
  }

  measure: avg_renda_aluno {
    type: average
    sql: ${fia_renda} ;;
    value_format: "$ #,###.00"
    group_label: "Renda Aluno"
    group_item_label: "Média"
    description: "Média da renda do aluno"
    required_access_grants: [grupo_renda]
    drill_fields: [id_proposta,
      id_cpf,
      aluno_nome,
      aluno_email,
      tipo_proposta]
  }

  dimension: qtd_arquivos_fila_interfile {
    type: number
    label: "Quantidade de arquivos na fila"
    group_label: "Dados da Formalização"
    description:"Indica a quantidade de arquivos na fila da Interfile."
    sql: ${TABLE}."QTD_ARQUIVOS_FILA_INTERFILE" ;;
  }

  measure: sum_qtd_arquivos_fila_interfile {
    type: sum
    label: "Quantidade de arquivos na fila"
    group_label: "Dados da Formalização"
    sql:${qtd_arquivos_fila_interfile};;
    description: "Soma da quantidade de arquivos na fila da Interfile."
  }

  dimension: qtd_arquivos_enviados {
    type: number
    label: "Quantidade de arquivos enviados"
    group_label: "Dados da Formalização"
    description:"Indica a quantidade de arquivos enviados para Interfile."
    sql: ${TABLE}."QTD_ARQUIVOS_ENVIADOS" ;;
  }

  measure: sum_qtd_arquivos_enviados {
    type: sum
    label: "Quantidade de arquivos enviados"
    group_label: "Dados da Formalização"
    sql:${qtd_arquivos_enviados};;
    description: "Soma da quantidade de arquivos enviados para Interfile."
  }

  dimension: renovou_proximo_ciclo {
    type: string
    label: "Renovou Proximo Ciclo"
    group_label: "Dados de Renovação"
    description:"Indica se o aluno renovou o ciclo seguinte."
    sql: ${TABLE}."FLG_RENOVOU_PROXIMO_CICLO" ;;
  }

  measure: count_renovou_proximo_ciclo {
    type: count_distinct
    sql_distinct_key: ${id_proposta} ;;
    sql:${id_proposta};;
    filters: [renovou_proximo_ciclo: "SIM"]
    label: "Quantidade de Renovados Proximo Ciclo"
    group_label: "Contrato"
    description: "Soma da quantidade de alunos que renovaram para o proximo ciclo."
    drill_fields: [detail*]
  }


  measure: count_primeira_contratacao {
    type: count_distinct
    sql_distinct_key: ${id_proposta} ;;
    sql:${id_proposta};;
    filters: [flg_primeira_contratacao: "yes"]
    label: "Quantidade de Renovados"
    group_label: "Contrato"
    description: "Soma da quantidade de alunos que renovaram por ciclo."
    drill_fields: [detail*]
  }



  measure: sum_qtd_contratos_cedidos {
    type: sum
    sql: qtd_contratos_cedidos ;;
    group_label: "Proposta"
    group_item_label: "Quantidade de Contratos Cedidos"
    description: "Indica a quantidade de contratos cedidos"
  }

  measure: sum_valor_principal_futuro {
    type: sum
    sql: ${TABLE}."VL_PRINCIPAL_FUTURO" ;;
    group_label: "Proposta"
    group_item_label: "Valor Principal Futuro"
    description: "Indica o valor previsto do contrato a ser cedido"
  }

  measure: sum_valor_repasse_futuro {
    type: sum
    sql: ${TABLE}."REPASSE_IES_FUTURO" ;;
    group_label: "Proposta"
    group_item_label: "Valor Repasse IES Futuro"
    description: "Indica o valor previsto do repasse da IES do contrato a ser cedido"
  }

  measure: sum_valor_comissao_futuro {
    type: sum
    sql: ${TABLE}."COMISSAO_PRV_FUTURO" ;;
    group_label: "Proposta"
    group_item_label: "Valor comissão PRV Futuro"
    description: "Indica o valor previsto da comissão PRV do contrato a ser cedido"
  }







  measure: count_linhas {
    type: count
    drill_fields: []
  }

  measure: qtd_alunos_cessao{
    type: count_distinct
    group_label: "Proposta"
    group_item_label: "Quantidade Alunos Cessão"
    description: "Indica a quantidade total de alunos na cessão"
    sql: ${id_cpf} ;;
  }

dimension: produto_preaprovado {
  type: string
  group_label: "Dados da Proposta"
  group_item_label: "Produtos Pré Aprovados"
  description: "Informa os produtos pré aprovados por risco para envio da IES"
  sql: ${TABLE}."PRODUTOS_PREAPROVADOS" ;;
}

  dimension: ciclo {
    type: string
    group_label: "Dados de Renovação"
    group_item_label: "Ciclo de Renovação"
    description: "Informa o ciclo da proposta de renovação do aluno."
    sql: ${TABLE}."CICLO" ;;
  }

  dimension: metodo_autenticacao {
    type: string
    group_label: "Dados do Contrato"
    group_item_label: "Método de Autenticação - Assinatura"
    description: "Indica o método de autenticação da proposta. Ex: WhatsApp, SMS ou e-mail."
    sql: ${TABLE}."METODO_AUTENTICACAO" ;;
  }




  set: detail {
    fields: [
      id_proposta,
      id_cpf,
      data_concessao_date,
      id_instituicao,
      tipo_proposta

    ]
  }


}
