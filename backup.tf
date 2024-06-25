resource "google_gke_backup_backup_plan" "backup_plan" {
  name            = "backup-plan"
  project         = var.project_id
  location        = "europe-west9"
  cluster         = "projects/sandbox-ngarvik/locations/europe-west9/clusters/cluster-gke"
  description     = "Backup plan for cluster-gke"
  backup_config {
    include_volume_data = true
    include_secrets = true
    selected_namespaces {
      namespaces = ["test"]
    }
  }
  backup_schedule {
    cron_schedule = "57 9 * * *"
  }
  retention_policy {
    backup_delete_lock_days = 30
    backup_retain_days = 180
  }
}

resource "google_gke_backup_restore_plan" "all_ns" {
  name = "restore-all-ns"
  location = "europe-west9"
  backup_plan = google_gke_backup_backup_plan.backup_plan.id
  project = var.project_id
  cluster = "projects/sandbox-ngarvik/locations/europe-west9/clusters/cluster-gke"
  restore_config {
    selected_namespaces {
      namespaces = ["test"]
    }
    namespaced_resource_restore_mode = "DELETE_AND_RESTORE"
    volume_data_restore_policy = "RESTORE_VOLUME_DATA_FROM_BACKUP"
    cluster_resource_restore_scope {
      all_group_kinds = true
    }
    cluster_resource_conflict_policy = "USE_EXISTING_VERSION"
  }
}
