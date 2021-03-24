# calantic project
module "notif_channel_calantic" {
  source = "../../modules/notification_channel"
  count  = length(var.address)

  project_id   = var.project_id
  channel_name = "${var.env}-${var.channel_name}-${count.index}"
  channel_type = var.channel_type
  address      = var.address[count.index]

}

module "logs_and_alerts_calantic" {
  source = "../../modules/log_metric_and_alerts"
  count  = length(var.metric_name)

  project_id        = var.project_id
  metric_name       = "${var.env}-${var.metric_name[count.index]}"
  metric_filter     = var.metric_filter[count.index]
  metric_kind       = var.metric_kind
  metric_value_type = var.metric_value_type
  alert_name        = "${var.env}-${var.alert_name[count.index]}"
  alert_combiner    = var.alert_combiner
  condition_name    = "${var.env}-${var.condition_name[count.index]}"
  condition_filter  = "metric.type=\"logging.googleapis.com/user/${var.env}-${var.metric_name[count.index]}\" AND resource.type=\"${var.condition_filter[count.index]}\""
  condition_threshold  = var.condition_threshold
  condition_duration   = var.condition_duration
  condition_comparison = var.condition_comparison
  aggregations_period  = var.aggregations_period
  aggregations_aligner = var.aggregations_aligner
  aggregations_reducer = var.aggregations_reducer

  notification_channels = module.notif_channel_calantic.*.address_names
}

# clinical app project
module "notif_channel_clinical" {
  source = "../../modules/notification_channel"
  count  = length(var.address)

  project_id   = var.clinical_app_project_id
  channel_name = "${var.env}-${var.channel_name}-${count.index}"
  channel_type = var.channel_type
  address      = var.address[count.index]

}

module "logs_and_alerts_clinical" {
  source = "../../modules/log_metric_and_alerts"
  count  = length(var.metric_name)

  project_id        = var.clinical_app_project_id
  metric_name       = "${var.env}-${var.metric_name[count.index]}"
  metric_filter     = var.metric_filter[count.index]
  metric_kind       = var.metric_kind
  metric_value_type = var.metric_value_type
  alert_name        = "${var.env}-${var.alert_name[count.index]}"
  alert_combiner    = var.alert_combiner
  condition_name    = "${var.env}-${var.condition_name[count.index]}"
  condition_filter  = "metric.type=\"logging.googleapis.com/user/${var.env}-${var.metric_name[count.index]}\" AND resource.type=\"${var.condition_filter[count.index]}\""
  condition_threshold  = var.condition_threshold
  condition_duration   = var.condition_duration
  condition_comparison = var.condition_comparison
  aggregations_period  = var.aggregations_period
  aggregations_aligner = var.aggregations_aligner
  aggregations_reducer = var.aggregations_reducer

  notification_channels = module.notif_channel_clinical.*.address_names
}
