connection: "jornada"

access_grant: grupo_nome {
  user_attribute: grupo_nome
  allowed_values: ["grupo_nome"]

}

access_grant: grupo_telefone {
  user_attribute: grupo_telefone
  allowed_values: ["grupo_telefone"]
}

access_grant: grupo_endereco {
  user_attribute: grupo_endereco
  allowed_values: ["grupo_endereco"]
}

access_grant: grupo_email {
  user_attribute: grupo_email
  allowed_values: ["grupo_email"]
}

access_grant: grupo_renda {
  user_attribute: grupo_renda
  allowed_values: ["grupo_renda"]
}

access_grant: grupo_cpf {
  user_attribute: grupo_cpf
  allowed_values: ["grupo_cpf"]
}

map_layer: MAPA_ESTADO_ALUNO {
  file: "/MAPAS/uf.json"
}

map_layer: MAPA_CIDADE_ALUNO {
  file: "/MAPAS/municipio.json"
}

 include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

explore: student {
  label: "Alunos"
  view_label: "Alunos"

  join: student_curso {
    view_label: "Cursos Alunos"
    sql_on: ${student.id_aluno} = ${student_curso.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }
     join: institution {
      view_label: "Cursos"
      sql_on: ${student_curso.id_curso} = ${institution.id_curso} ;;
      type: left_outer
      relationship: one_to_many
      }

      join: institution_cupons {
        view_label: "Cupons"
        sql_on: ${institution_cupons.id_curso} = ${institution.id_curso} ;;
        type: left_outer
        relationship: one_to_many
      }


  join: risk {
    view_label: "Risco"
    sql_on: ${student.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

      join: fiador {
        from:  student
        view_label: "Fiador"
        sql_on: ${fiador.cpf_aluno} = ${student.cpf_fiador} ;;
        type: left_outer
        relationship: one_to_many

      }


  join: risk_fiador {
    from: risk
    view_label: "Risco Fiador"
    sql_on: ${fiador.id_aluno} = ${risk_fiador.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }


      join: analise_risco {
        view_label: "Análises de Risco"
        sql_on: ${analise_risco.id_aluno} = ${risk.id_aluno} ;;
        type: left_outer
        relationship: one_to_many
      }

      join: contracts {
        view_label: "Contratos"
        sql_on: ${contracts.id_aluno} = ${student.id_aluno} ;;
        type: left_outer
        relationship: one_to_many
      }

  join: contracts_desc_taxas {
    view_label: "Contratos Taxas"
    sql_on: ${contracts_desc_taxas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas_externas {
    view_label: "Contratos Taxas Externas"
    sql_on: ${contracts_desc_taxas_externas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payment {
    view_label: "Responsável Pelo Boleto"
    sql_on: ${payment.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payments_boletos {
    view_label: "Boletos"
    sql_on: ${payments_boletos.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

}

explore: contracts {
  label: "Contratos"

  join: contracts_desc_taxas {
    view_label: "Contratos Taxas"
    sql_on: ${contracts_desc_taxas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas_externas {
    view_label: "Contratos Taxas Externas"
    sql_on: ${contracts_desc_taxas_externas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: student {
    view_label: "Alunos"
    sql_on: ${student.id_aluno} = ${contracts.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: student_curso {
    view_label: "Cursos Alunos"
    sql_on: ${student.id_aluno} = ${student_curso.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: institution {
    view_label: "Cursos"
    sql_on: ${student_curso.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: institution_cupons {
    view_label: "Cupons"
    sql_on: ${institution_cupons.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: risk {
    view_label: "Risco"
    sql_on: ${student.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: fiador {
    from:  student
    view_label: "Fiador"
    sql_on: ${fiador.cpf_aluno} = ${student.cpf_fiador} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: risk_fiador {
    from: risk
    view_label: "Risco Fiador"
    sql_on: ${fiador.id_aluno} = ${risk_fiador.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: analise_risco {
    view_label: "Análises de Risco"
    sql_on: ${analise_risco.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payment {
    view_label: "Responsável Pelo Boleto"
    sql_on: ${payment.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payments_boletos {
    view_label: "Boletos"
    sql_on: ${payments_boletos.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }


}

explore: risk {
  label: "Risco"
  join: analise_risco {
    view_label: "Análises de Risco"
    sql_on: ${analise_risco.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: student {
    view_label: "Alunos"
    sql_on: ${student.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: student_curso {
    view_label: "Cursos Alunos"
    sql_on: ${student.id_aluno} = ${student_curso.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: institution {
    view_label: "Cursos"
    sql_on: ${student_curso.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: institution_cupons {
    view_label: "Cupons"
    sql_on: ${institution_cupons.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts {
    view_label: "Contratos"
    sql_on: ${contracts.id_aluno} = ${student.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas {
    view_label: "Contratos Taxas"
    sql_on: ${contracts_desc_taxas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas_externas {
    view_label: "Contratos Taxas Externas"
    sql_on: ${contracts_desc_taxas_externas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payment {
    view_label: "Responsável Pelo Boleto"
    sql_on: ${payment.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: fiador {
    from:  student
    view_label: "Fiador"
    sql_on: ${fiador.cpf_aluno} = ${student.cpf_fiador} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: risk_fiador {
    from: risk
    view_label: "Risco Fiador"
    sql_on: ${fiador.id_aluno} = ${risk_fiador.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: payments_boletos {
    view_label: "Boletos"
    sql_on: ${payments_boletos.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

}

explore: payment {
  label: "Boletos"

  join: contracts {
    view_label: "Contratos"
    sql_on: ${payment.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas {
    view_label: "Contratos Taxas"
    sql_on: ${contracts_desc_taxas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas_externas {
    view_label: "Contratos Taxas Externas"
    sql_on: ${contracts_desc_taxas_externas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payments_boletos {
    view_label: "Boletos"
    sql_on: ${payments_boletos.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: student {
    view_label: "Alunos"
    sql_on: ${student.id_aluno} = ${contracts.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: student_curso {
    view_label: "Cursos Alunos"
    sql_on: ${student.id_aluno} = ${student_curso.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: institution {
    view_label: "Cursos"
    sql_on: ${student_curso.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: institution_cupons {
    view_label: "Cupons"
    sql_on: ${institution_cupons.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: risk {
    view_label: "Risco"
    sql_on: ${student.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: fiador {
    from:  student
    view_label: "Fiador"
    sql_on: ${fiador.cpf_aluno} = ${student.cpf_fiador} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: risk_fiador {
    from: risk
    view_label: "Risco Fiador"
    sql_on: ${fiador.id_aluno} = ${risk_fiador.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: analise_risco {
    view_label: "Análises de Risco"
    sql_on: ${analise_risco.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }
}

explore: status_curta {
  label:"Status"

  join: student {
    view_label: "Alunos"
    sql_on: ${student.id_aluno} = ${status_curta.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: student_curso {
    view_label: "Cursos Alunos"
    sql_on: ${student.id_aluno} = ${student_curso.id_aluno} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: institution {
    view_label: "Cursos"
    sql_on: ${student_curso.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: institution_cupons {
    view_label: "Cupons"
    sql_on: ${institution_cupons.id_curso} = ${institution.id_curso} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: risk {
    view_label: "Risco"
    sql_on: ${student.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: fiador {
    from:  student
    view_label: "Fiador"
    sql_on: ${fiador.cpf_aluno} = ${student.cpf_fiador} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: risk_fiador {
    from: risk
    view_label: "Risco Fiador"
    sql_on: ${fiador.id_aluno} = ${risk_fiador.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: analise_risco {
    view_label: "Análises de Risco"
    sql_on: ${analise_risco.id_aluno} = ${risk.id_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts {
    view_label: "Contratos"
    sql_on: ${contracts.id_aluno} = ${student.id_aluno};;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas {
    view_label: "Contratos Taxas"
    sql_on: ${contracts_desc_taxas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: contracts_desc_taxas_externas {
    view_label: "Contratos Taxas Externas"
    sql_on: ${contracts_desc_taxas_externas.id_contrato} = ${contracts.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payment {
    view_label: "Responsável Pelo Boleto"
    sql_on: ${payment.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: payments_boletos {
    view_label: "Boletos"
    sql_on: ${payments_boletos.chave_contrato} = ${contracts.chave_payment} ;;
    type: left_outer
    relationship: one_to_many
  }

}
