view: historico_demograficos {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI".DADOS_DEMOGRAFICOS
    ;;

  dimension_group: admissao {
    type: time
    timeframes: [
      date,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ADMISSAO" ;;
    label: "ADMISSÃO"
    group_label: "DATA DE ADMISSÃO"
    view_label:  "DADOS PROFISSIONAIS"
    description: "Informa a data em que o Pravalente foi admitido"
  }

  dimension: cargo {
    label: "CARGO COMPLETO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa o cargo que o Pravalete ocupa"
    type: string
    sql: ${TABLE}."CARGO" ;;
  }

  dimension: cargoM {
    label: "NÍVEL DO CARGO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa o nível do cargo que o Pravalete ocupa"
    type: string
    sql: left(ltrim(${TABLE}."CARGO"), charindex(' ', ${TABLE}."CARGO")) ;;
    drill_fields: [nome]
  }

  dimension: cbo {
    label: "CBO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Classificação brasileira de ocupações"
    type: number
    sql: ${TABLE}."CBO" ;;
  }

  dimension_group: rescisao {
    label: "DATA DA RESCISÃO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa a data da rescisão"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_RESCISAO" ;;
  }

  dimension: faixa_etaria {
    label: "FAIXA ETÁRIA"
    view_label: "DADOS PESSOAIS"
    description: "Informa a faixa etária do Pravalente"
    type: string
    sql: CASE WHEN  ltrim(rtrim(${TABLE}."FAIXA_ETARIA")) = '50 +' THEN 'Maior que 50' ELSE ${TABLE}."FAIXA_ETARIA" END;;
    drill_fields: [nome]
  }

  dimension: faixa_tempo {
    label: "FAIXA DE TEMPO DE CASA"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa a faixa de tempo que o Pravalente está com a gente"
    type: string
    sql: ${TABLE}."FAIXA_TEMPO" ;;
  }

  dimension: grau_instrucao {
    label: "GRAU DE INSTRUÇÃO"
    view_label: "DADOS PESSOAIS"
    description: "Informa o nível de escolaridade do Pravalente"
    type: string
    sql: ${TABLE}."GRAU_INSTRUCAO" ;;
  }

  dimension: area {
    label: "AREA DE ATUAÇÃO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa a área de atuação do Pravalente"
    type: string
    sql: ${TABLE}."AREA" ;;
  }

  dimension: area_head {
    label: "AREA HEAD"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa a diretoria de atuação do Pravalente"
    type: string
    sql: ${TABLE}."AREA_HEAD" ;;
  }

  dimension: idade_atualizada {
    label: "IDADE"
    view_label: "DADOS PESSOAIS"
    description: "Informa a idade do Pravalente"
    type: number
    sql: DATEDIFF(year,coalesce(${nascimento_date},null),current_date()) ;;
  }

  dimension: matricula {
    label: "NÚMERO DE MATRÍCULA"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa o número de matrícula do Pravalente"
    type: number
    sql: ${TABLE}."MATRICULA" ;;
  }

  dimension_group: nascimento {
    label: "DATA DE NASCIMENTO"
    view_label: "DADOS PESSOAIS"
    description: "Informa a data de nascimento do Pravalente"
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
    sql: ${TABLE}."NASCIMENTO" ;;
    hidden: yes
  }

  dimension_group: ano_mes {
    label: "ANO MES"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa a data da jornada do Pravalente"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: data_nascimento {
    type: date
    sql: ${nascimento_date} ;;
    label: "DATA DE NASCIMENTO"
    group_label: "DATA DE NASCIMENTO"
    view_label:  "DADOS PESSOAIS"
    description: "Informa a data de nascimento do Pravalente"
  }

  dimension: mes_nascimento {
    type: date
    sql: ${nascimento_month} ;;
    label: "MÊS DE NASCIMENTO"
    group_label: "DATA DE NASCIMENTO"
    view_label:  "DADOS PESSOAIS"
    description: "Informa o mês de nascimento do Pravalente"
  }

  dimension: ano_nascimento {
    type: date
    sql: ${nascimento_year} ;;
    label: "ANO DE NASCIMENTO"
    group_label: "DATA DE NASCIMENTO"
    view_label:  "DADOS PESSOAIS"
    description: "Informa o ano de nascimento do Pravalente"
  }

  dimension: nome {
    label: "NOME COMPLETO"
    view_label: "DADOS PESSOAIS"
    description: "Informa o nome completo do Pravalente"
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: raca {
    label: "ETNIA"
    view_label: "DADOS PESSOAIS"
    description: "Informa a etnia do Pravalente"
    type: string
    sql: ${TABLE}."RACA" ;;
  }

  dimension: sexo {
    label: "SEXO"
    view_label: "DADOS PESSOAIS"
    description: "Informa o sexo do Pravalente"
    type: string
    sql: ${TABLE}."SEXO" ;;
  }

  dimension: situacao {
    label: "SITUAÇÃO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa a situação atual do Pravalente (ativo/desligado)"
    type: string
    sql: ${TABLE}."SITUACAO" ;;
  }

  dimension: tempo_casa {
    label: "TEMPO DE CASA"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa o tempo de casa do Pravalente"
    type: number
    sql: ${TABLE}."TEMPO_CASA" ;;
  }

  dimension: tipo_rescisao {
    label: "TIPO DE RESCISÃO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa o tipo de rescisão no desligamento do Pravalente"
    type: string
    sql: ${TABLE}."TIPO_RESCISAO" ;;
  }

  dimension: nivel {
    label: "NIVEL DE CARGO"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa o nivel de cargo do Pravalente"
    type: string
    sql: ${TABLE}."NIVEL" ;;
  }

  dimension: empresa {
    label: "EMPRESA"
    view_label: "DADOS PROFISSIONAIS"
    description: "Informa de qual empresa inicial o Pravalente é proveniente"
    type: string
    sql: ${TABLE}."EMPRESA" ;;
  }

  measure: count {
    label: "CONTAGEM DE OCORRÊNCIAS"
    view_label: "MÉTRICAS"
    #description: "Informa a situação atual do Pravalente"
    sql: ${nome};;
    type: count_distinct
    drill_fields: []
    description: "Contagem de ocorrências é a contagem da quantidade do que estamos filtrando, por exemplo, contar a ocorrência do gênero feminino dentro do Pravaler."
  }

  measure: porcentagem {
    label: "PORCENTAGEM DE OCORRÊNCIAS"
    view_label: "MÉTRICAS"
    #description: "Informa a situação atual do Pravalente"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: []
    description: "Porcentagem de ocorrências é a porcentagem da quantidade do que estamos filtrando, por exemplo, porcentagem da ocorrência do gênero feminino dentro do Pravaler"
  }

  measure: ativos {
    label: "TOTAL DE ATIVOS"
    view_label: "MÉTRICAS"
    filters: [situacao: "ATIVO"]
    sql: ${nome};;
    type: count_distinct
    drill_fields: []
    description: "Quantidade de colaboradores ativos"
  }

  measure: desligados_voluntarios {
    label: "TOTAL DE DESLIGADOS VOLUNTÁRIOS"
    view_label: "MÉTRICAS"
    filters: [situacao: "DESLIGADO",
              tipo_rescisao: "Voluntário, VOLUNTÁRIO"]
    sql: ${nome};;
    type: count_distinct
    drill_fields: []
    description: "Quantidade de Pravalentes que fizeram o pedido de desligamento"
  }

  measure: desligados_involuntarios {
    label: "TOTAL DE DESLIGADOS INVOLUNTÁRIOS"
    view_label: "MÉTRICAS"
    filters: [situacao: "DESLIGADO",
      tipo_rescisao: "Involuntária"]
    sql: ${nome};;
    type: count_distinct
    drill_fields: []
    description: "Quantidade de Pravalentes que foram desligados"
  }

  measure: percentual_turnover_voluntario {
    label: "PERCENTUAL DE TURNOVER VOLUNTÁRIOS"
    view_label: "MÉTRICAS"
    type: number
    sql: case when ${ativos} =0 then null else (${desligados_voluntarios}/${ativos})*100 end  ;;
    value_format: "0.00\%"
    drill_fields: []
    description: "Percentual de Pravalentes que fizeram o pedido de desligamento (turnover voluntários)"
  }

  measure: percentual_turnover_involuntario {
    label: "PERCENTUAL DE TURNOVER INVOLUNTÁRIOS"
    view_label: "MÉTRICAS"
    type: number
    sql: case when ${ativos} =0 then null else (${desligados_involuntarios}/${ativos})*100 end  ;;
    value_format: "0.00\%"
    drill_fields: []
    description: "Percentual de Pravalentes que foram desligados (turnover involuntários)"
  }

  dimension: ordem_tempo_casa_tabela {
    type: string
    case: {
      when: {
        sql: ${faixa_tempo} = '3 meses ou menos' ;;
        label: "1"
      }
      when: {
        sql: ${faixa_tempo} = 'Entre 4 e 6 meses'  ;;
        label: "2"
      }
      when: {
        sql: ${faixa_tempo} = 'Entre 7 e 11 meses'  ;;
        label: "3"
      }
      when: {
        sql: ${faixa_tempo} = 'Entre 1 ano e 1 ano e 11 meses'  ;;
        label: "4"
      }
      when: {
        sql: ${faixa_tempo} = '2 anos ou mais' ;;
        label: "5"
      }
      else: "0"
    }
    description: "Este campo é uma regra de negócio*. Indica a ordenadação de 1 à 5 a faixa de tempo do Pravalente. Então: 3 meses ou menos = 1; entre 4 e 6 meses = 2; entre 7 e 11 = 3; entre 1 ano e 1 ano e 11 meses = 4; 2 anos ou mais = 5; e caso contrário, não atender essas regras o valor será = 0"
    hidden: yes
  }

  dimension: ordem_tempo_casa {
    type: number
    label: "Ordem - Tempo de Casa"
    sql: ${ordem_tempo_casa_tabela} ;;
    description: "Este campo segue uma regra de negócio para ordenarmos de 1 a 5 a faixa de tempo do Pravalente. Então: 3 meses ou menos = 1; entre 4 e 6 meses = 2; entre 7 e 11 = 3; entre 1 ano e 1 ano e 11 meses = 4; 2 anos ou mais = 5; e caso contrário, não atender essas regras o valor será = 0"
  }

}
