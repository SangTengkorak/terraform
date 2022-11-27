# Create basic GCP Spanner instance.
resource "google_spanner_instance" "spanner_from_tf" {
  config       = "regional-asia-southeast1"
  display_name = "Spanner from TF"
  num_nodes    = 1
  labels = {
    "env" = "learning_tf"
  }
}

# Create database that use Spanner instance.
resource "google_spanner_database" "database_tf" {
  instance = google_spanner_instance.spanner_from_tf.name
  name     = "my-tf-database"
  # version_retention_period = "3d"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}