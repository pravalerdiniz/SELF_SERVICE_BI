view: jornada_como_soube {
    derived_table: {
      persist_for: "24 hours"
      sql: select distinct id_cpf, lp.cpf, como_soube_complemento, data from bicho.bo.leads_proposta lp
            left join veterano.dimensao.dim_cpf dc on dc.cpf = lp.cpf
            where "como_soube_complemento" in ('Tetris','NovaProposta','')
            or "como_soube_complemento" is null
            and data > '2022-01-01'
;;
    }

    dimension_group: data_lead {
      type: time
      sql: ${TABLE}."DATA" ;;
    }

    dimension: como_soube_complemento {
      type:  string
      sql:  ${TABLE}."COMO_SOUBE_COMPLEMENTO" ;;
      hidden: no
      group_label: "Dados do Aluno"
      group_item_label: "Como Soube Complemento - Nova Proposta"
    }

    dimension: id_cpf {
      type:  number
      primary_key: yes
      sql: ${TABLE}."ID_CPF" ;;
    }

}
