resource "google_logging_metric" "logging_metric" {
  project = var.project_id
  name   = var.metric_name
  filter = var.metric_filter
  metric_descriptor {
    metric_kind = var.metric_kind
    value_type  = var.metric_value_type
  }
}


resource "google_monitoring_alert_policy" "alert_policy" {
  project = var.project_id
  display_name = var.alert_name
  combiner     = var.alert_combiner
  conditions {
    display_name = var.condition_name
    condition_threshold {
      filter          = var.condition_filter
      threshold_value = var.condition_threshold
      duration        = var.condition_duration
      comparison      = var.condition_comparison
      aggregations {
        alignment_period   = var.aggregations_period
        per_series_aligner = var.aggregations_aligner
        cross_series_reducer = var.aggregations_reducer
      }
    }
  }

  notification_channels = var.notification_channels
  depends_on = [google_logging_metric.logging_metric]
}
