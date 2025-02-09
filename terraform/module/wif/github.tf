locals {
  my_github_repository = "VideoFlowAI"
}

resource "google_project_iam_member" "wif_principal" {
  for_each = toset([
    "roles/run.admin",
    "roles/cloudfunctions.developer",
    "roles/pubsub.admin",
    "roles/storage.objectAdmin",
    "roles/secretmanager.secretAccessor",
    "roles/artifactregistry.writer"
  ])
  project = data.google_project.current.project_id
  role    = each.value
  member  = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/attribute.repository/${local.my_github_repository_owner}/${local.my_github_repository}"
}
