view: aluno_como_soube {
  derived_table: {
    persist_for: "1 hour"
    sql: select distinct coalesce(last_sync_data:data:student:cpf:"$numberLong"::string,last_sync_data:data:student:cpf::string) as cpf
        ,last_sync_data:data:proposal:how_knew_options::string as como_soube_mongo
        from "BICHO"."DOCDB"."DOCDB_INTEGRATIONS"
        order by integrated_at asc;;
  }


  dimension: como_soube_mongo {
    type: string
    sql: ${TABLE}."COMO_SOUBE_MONGO" ;;
    hidden: yes
  }

  dimension: sem_fiador_eleito {
    type: string
    sql: case when ${como_soube_mongo} = "NovaProposta" then "TRUE" else  ;;
    hidden: yes
    label: "Flag Eleito - Sem Fiador Teste A/B"
    group_label: "Sem Fiador - Teste A/B"
  }

  dimension: cpf {
    type:  string
    sql: ${TABLE}."CPF" ;;
    hidden: yes
  }


}
