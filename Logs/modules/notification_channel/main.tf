resource "google_monitoring_notification_channel" "email" {
  project = var.project_id
  display_name = var.channel_name
  type         = var.channel_type
  labels = {
    email_address = var.address
  }
}
