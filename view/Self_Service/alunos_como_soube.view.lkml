view: alunos_como_soube {
  derived_table: {
    persist_for: "1 hour"
    sql: select distinct coalesce(last_sync_data:data:student:cpf:"$numberLong"::string,last_sync_data:data:student:cpf::string) as cpf
        ,last_sync_data:data:proposal:how_knew_options::string as como_soube_mongo
        from "BICHO"."DOCDB"."DOCDB_INTEGRATIONS"
where integrated_at > '2022-07-01'
qualify row_number() over(partition by coalesce(last_sync_data:data:student:cpf:"$numberLong"::string,last_sync_data:data:student:cpf::string) order by integrated_at desc)=1
        ;;
  }


  dimension: como_soube_mongo {
    type: string
    sql: ${TABLE}."COMO_SOUBE_MONGO" ;;
    hidden: yes
  }

  dimension: flag_nova_proposta {
    type: yesno
    sql: ${como_soube_mongo} = 'NovaProposta';;
    hidden: no
    label: "Flag Nova Proposta"
    group_label: "Dados da Proposta"
  }

  dimension: cpf {
    type:  string
    sql: ${TABLE}."CPF" ;;
    hidden: yes
  }


}
