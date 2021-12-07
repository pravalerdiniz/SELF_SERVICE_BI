view: pipedrive_atividades {
  derived_table: {
    sql: SELECT * FROM "BICHO"."PIPEDRIVE"."ACTIVITIES"
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    label: "ID da Atividade"
    primary_key: yes
    sql: ${TABLE}."ID" ;;
  }

  dimension: company_id {
    type: number
    label: "Company ID"
    sql: ${TABLE}."COMPANY_ID" ;;
  }

  dimension: user_id {
    type: number
    label: "User ID"
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: done {
    type: string
    label: "Finalizado?"
    description: "Indica se a atividade já foi finalizada (True/False)"
    sql: ${TABLE}."DONE" ;;
  }

  dimension: type {
    type: string
    label: "Tipo da atividade"
    description: "Tipo da Atividade"
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: reference_type {
    type: string
    label: "Referência do Tipo"
    sql: ${TABLE}."REFERENCE_TYPE" ;;
  }

  dimension: reference_id {
    type: number
    label: "Referência ID"
    sql: ${TABLE}."REFERENCE_ID" ;;
  }

  dimension: conference_meeting_client {
    type: number
    label: "CONFERENCE MEETING CLIENT"
    sql: ${TABLE}."CONFERENCE_MEETING_CLIENT" ;;
  }

  dimension: conference_meeting_url {
    type: number
    label: "URL reunião"
    sql: ${TABLE}."CONFERENCE_MEETING_URL" ;;
  }

  dimension: due_date {
    type: date
    group_label: "Prazo de Entrega"
    group_item_label: "Data Vencimento"
    description: "Data de Venciemnto da Atividade"
    sql: ${TABLE}."DUE_DATE" ;;
  }

  dimension_group: due_time {
    type: time
    group_label: "Prazo de Entrega"
    group_item_label: "Hora Vencimento"
    description: "Hora de Entrega da Atividade"
    sql: ${TABLE}."DUE_TIME" ;;
  }

  dimension: duration {
    type: string
    group_label: "Prazo de Entrega"
    group_item_label: "Duração"
    description: "Tempo da atividade"
    sql: ${TABLE}."DURATION" ;;
  }

  dimension: busy_flag {
    type: number
    label: "Busy_flag"
    description: "Define a atividade como 'Ocupada' ou 'Livre'. Se flag=1, então, seus clientes não poderão reservar esse intervalo de tempo"
    sql: ${TABLE}."BUSY_FLAG" ;;
  }

  dimension_group: add_time {
    type: time
    label: "Add Time"
    sql: ${TABLE}."ADD_TIME" ;;
  }

  dimension_group: marked_as_done_time {
    type: time
    label: "Marked as done time"
    sql: ${TABLE}."MARKED_AS_DONE_TIME" ;;
  }

  dimension_group: last_notification_time {
    type: time
    label: "Last notification time"
    sql: ${TABLE}."LAST_NOTIFICATION_TIME" ;;
  }

  dimension: last_notification_user_id {
    type: number
    label: "Last notification user id"
    sql: ${TABLE}."LAST_NOTIFICATION_USER_ID" ;;
  }

  dimension: notification_language_id {
    type: number
    label: "Notification language id"
    sql: ${TABLE}."NOTIFICATION_LANGUAGE_ID" ;;
  }

  dimension: subject {
    type: string
    label: "Assunto da Atividade"
    sql: ${TABLE}."SUBJECT" ;;
  }

  dimension: public_description {
    type: string
    label: "Descrição da atividade"
    sql: ${TABLE}."PUBLIC_DESCRIPTION" ;;
  }

  dimension: calendar_sync_include_context {
    type: number
    label: "Sincronizar com o calendáro"
    sql: ${TABLE}."CALENDAR_SYNC_INCLUDE_CONTEXT" ;;
  }

  dimension: location {
    type: string
    label: "Localização"
    description: "Localização da atividade"
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: org_id {
    type: number
    label: "ID Organização"
    description: "O ID da organização à qual esta atividade está associada"
    sql: ${TABLE}."ORG_ID" ;;
  }

  dimension: person_id {
    type: number
    label: "Pessoa ID"
    description: "O ID da pessoa à qual esta atividade está associada"
    sql: ${TABLE}."PERSON_ID" ;;
  }

  dimension: deal_id {
    type: number
    label: "ID do negócio"
    description: "O ID do negócio"
    sql: ${TABLE}."DEAL_ID" ;;
  }

  dimension: lead_id {
    type: number
    label: "ID Lead"
    sql: ${TABLE}."LEAD_ID" ;;
  }

  dimension: active_flag {
    type: string
    label: "Ativo?"
    sql: ${TABLE}."ACTIVE_FLAG" ;;
  }

  dimension_group: update_time {
    type: time
    label: "Hora da Atualização"
    sql: ${TABLE}."UPDATE_TIME" ;;
  }

  dimension: update_user_id {
    type: number
    label: "Usuário da Atualização"
    sql: ${TABLE}."UPDATE_USER_ID" ;;
  }

  dimension: gcal_event_id {
    type: number
    label: "gcal_event_id"
    sql: ${TABLE}."GCAL_EVENT_ID" ;;
  }

  dimension: google_calendar_id {
    type: number
    label: "ID Google Calendar"
    sql: ${TABLE}."GOOGLE_CALENDAR_ID" ;;
  }

  dimension: google_calendar_etag {
    type: number
    label: "google_calendar_etag"
    sql: ${TABLE}."GOOGLE_CALENDAR_ETAG" ;;
  }

  dimension: source_timezone {
    type: string
    label: "Timezone"
    sql: ${TABLE}."SOURCE_TIMEZONE" ;;
  }

  dimension: rec_rule {
    type: string
    label: "REC_RULE"
    sql: ${TABLE}."REC_RULE" ;;
  }

  dimension: rec_rule_extension {
    type: number
    label: "REC_RULE_EXTENSION"
    sql: ${TABLE}."REC_RULE_EXTENSION" ;;
  }

  dimension: rec_master_activity_id {
    type: number
    label: "REC_MASTER_ACTIVITY_ID"
    sql: ${TABLE}."REC_MASTER_ACTIVITY_ID" ;;
  }

  dimension: conference_meeting_id {
    type: number
    label: "ID da Reunião"
    sql: ${TABLE}."CONFERENCE_MEETING_ID" ;;
  }

  dimension: note {
    type: string
    label: "Anotações"
    sql: ${TABLE}."NOTE" ;;
  }

  dimension: created_by_user_id {
    type: number
    label: "ID User - Criou a atividade"
    sql: ${TABLE}."CREATED_BY_USER_ID" ;;
  }

  dimension: location_subpremise {
    type: number
    group_label: "Localização"
    group_item_label: "Premissa de Localização"
    sql: ${TABLE}."LOCATION_SUBPREMISE" ;;
  }

  dimension: location_street_number {
    type: number
    group_label: "Localização"
    group_item_label: "Número da Rua"
    description: "Indica o Número da Rua (se tiver) da Instituição"
    sql: ${TABLE}."LOCATION_STREET_NUMBER" ;;
  }

  dimension: location_route {
    type: number
    group_label: "Localização"
    group_item_label: "Rota"
    description: "Indica a rota da Localização"
    sql: ${TABLE}."LOCATION_ROUTE" ;;
  }

  dimension: location_sublocality {
    type: number
    group_label: "Localização"
    group_item_label: "Sublocalidade"
    description: "Indica a sublocalidade da Instituição"
    sql: ${TABLE}."LOCATION_SUBLOCALITY" ;;
  }

  dimension: location_locality {
    type: number
    group_label: "Localização"
    group_item_label: "Localidade"
    #description: "Indica o sexo do aluno"
    sql: ${TABLE}."LOCATION_LOCALITY" ;;
  }

  dimension: location_admin_area_level_1 {
    type: number
    group_label: "Localização"
    group_item_label: "admin_area_level_1"
    #description: ""
    hidden: yes
    sql: ${TABLE}."LOCATION_ADMIN_AREA_LEVEL_1" ;;
  }

  dimension: location_admin_area_level_2 {
    type: number
    group_label: "Localização"
    group_item_label: "admin_area_level_2"
    description: ""
    hidden: yes
    sql: ${TABLE}."LOCATION_ADMIN_AREA_LEVEL_2" ;;
  }

  dimension: location_country {
    type: number
    group_label: "Localização"
    group_item_label: "País"
    description: "Indica o país da Instituição"
    sql: ${TABLE}."LOCATION_COUNTRY" ;;
  }

  dimension: location_postal_code {
    type: number
    group_label: "Localização"
    group_item_label: "Código Postal"
    description: "Indica o código postal da Instituição"
    sql: ${TABLE}."LOCATION_POSTAL_CODE" ;;
  }

  dimension: location_formatted_address {
    type: number
    group_label: "Localização"
    group_item_label: "Endereço"
    description: "Endereço da Instituição"
    sql: ${TABLE}."LOCATION_FORMATTED_ADDRESS" ;;
  }

  dimension: attendees {
    type: string
    label: "ATTENDEES"
    sql: ${TABLE}."ATTENDEES" ;;
  }

  dimension: participants {
    type: string
    label: "Participantes"
    sql: ${TABLE}."PARTICIPANTS" ;;
  }

  dimension: series {
    type: string
    label: "SERIES"
    sql: ${TABLE}."SERIES" ;;
  }

  dimension: org_name {
    type: string
    label: "ORG_NAME"
    sql: ${TABLE}."ORG_NAME" ;;
  }

  dimension: person_name {
    type: string
    label: "PERSON_NAME"
    sql: ${TABLE}."PERSON_NAME" ;;
  }

  dimension: deal_title {
    type: string
    label: "DEAL_TITLE"
    sql: ${TABLE}."DEAL_TITLE" ;;
  }

  dimension: lead_title {
    type: number
    label: "LEAD_TITLE"
    sql: ${TABLE}."LEAD_TITLE" ;;
  }

  dimension: owner_name {
    type: string
    label: "OWNER_NAME"
    sql: ${TABLE}."OWNER_NAME" ;;
  }

  dimension: person_dropbox_bcc {
    type: string
    label: "PERSON_DROPBOX_BCC"
    sql: ${TABLE}."PERSON_DROPBOX_BCC" ;;
  }

  dimension: deal_dropbox_bcc {
    type: string
    label: "DEAL_DROPBOX_BCC"
    sql: ${TABLE}."DEAL_DROPBOX_BCC" ;;
  }

  dimension: assigned_to_user_id {
    type: number
    label: "ASSIGNED_TO_USER_ID"
    sql: ${TABLE}."ASSIGNED_TO_USER_ID" ;;
  }

  dimension: type_name {
    type: string
    label: "TYPE_NAME"
    sql: ${TABLE}."TYPE_NAME" ;;
  }

  dimension: lead {
    type: number
    label: "LEAD"
    sql: ${TABLE}."LEAD" ;;
  }

  set: detail {
    fields: [
      id,
      company_id,
      user_id,
      done,
      type,
      reference_type,
      reference_id,
      conference_meeting_client,
      conference_meeting_url,
      due_date,
      due_time_time,
      duration,
      busy_flag,
      add_time_time,
      marked_as_done_time_time,
      last_notification_time_time,
      last_notification_user_id,
      notification_language_id,
      subject,
      public_description,
      calendar_sync_include_context,
      location,
      org_id,
      person_id,
      deal_id,
      lead_id,
      active_flag,
      update_time_time,
      update_user_id,
      gcal_event_id,
      google_calendar_id,
      google_calendar_etag,
      source_timezone,
      rec_rule,
      rec_rule_extension,
      rec_master_activity_id,
      conference_meeting_id,
      note,
      created_by_user_id,
      location_subpremise,
      location_street_number,
      location_route,
      location_sublocality,
      location_locality,
      location_admin_area_level_1,
      location_admin_area_level_2,
      location_country,
      location_postal_code,
      location_formatted_address,
      attendees,
      participants,
      series,
      org_name,
      person_name,
      deal_title,
      lead_title,
      owner_name,
      person_dropbox_bcc,
      deal_dropbox_bcc,
      assigned_to_user_id,
      type_name,
      lead
    ]
  }
}
