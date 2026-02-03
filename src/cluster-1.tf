# Please review the plan carefully before applying.
resource "google_container_cluster" "cluster_1" {
  allow_net_admin                          = null
  datapath_provider                        = null
  default_max_pods_per_node                = 110
  deletion_protection                      = true
  description                              = null
  disable_l4_lb_firewall_reconciliation    = false
  enable_cilium_clusterwide_network_policy = false
  enable_fqdn_network_policy               = false
  enable_intranode_visibility              = false
  enable_kubernetes_alpha                  = false
  enable_l4_ilb_subsetting                 = false
  enable_legacy_abac                       = false
  enable_multi_networking                  = false
  enable_shielded_nodes                    = true
  enable_tpu                               = false
  in_transit_encryption_config             = null
  initial_node_count                       = 0
  location                                 = "us-west1-c"
  min_master_version                       = null
  name                                     = "cluster-1"
  network                                  = "projects/qwiklabs-gcp-02-f2dfa963bd61/global/networks/default"
  networking_mode                          = "VPC_NATIVE"
  node_locations                           = []
  node_version                             = "1.34.1-gke.3971001"
  private_ipv6_google_access               = null
  project                                  = "qwiklabs-gcp-02-f2dfa963bd61"
  remove_default_node_pool                 = null
  resource_labels                          = {}
  subnetwork                               = "projects/qwiklabs-gcp-02-f2dfa963bd61/regions/us-west1/subnetworks/default"
  addons_config {
    dns_cache_config {
      enabled = true
    }
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
    network_policy_config {
      disabled = true
    }
  }
  anonymous_authentication_config {
    mode = "ENABLED"
  }
  cluster_autoscaling {
    auto_provisioning_locations   = []
    autoscaling_profile           = "BALANCED"
    default_compute_class_enabled = false
    enabled                       = false
  }
  control_plane_endpoints_config {
    dns_endpoint_config {
      allow_external_traffic    = false
      enable_k8s_certs_via_dns  = false
      enable_k8s_tokens_via_dns = false
      endpoint                  = "gke-5bd58a3f663748c983bfb60fa69f5b8a7f03-447397610692.us-west1-c.gke.goog"
    }
    ip_endpoints_config {
      enabled = true
    }
  }
  database_encryption {
    key_name = null
    state    = "DECRYPTED"
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-cluster-1-pods-5bd58a3f"
    services_secondary_range_name = null
    stack_type                    = "IPV4"
    network_tier_config {
      network_tier = "NETWORK_TIER_DEFAULT"
    }
    pod_cidr_overprovision_config {
      disabled = false
    }
  }
  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS", "STATEFULSET", "JOBSET", "STORAGE", "HPA", "POD", "DAEMONSET", "DEPLOYMENT", "CADVISOR", "KUBELET", "DCGM"]
    advanced_datapath_observability_config {
      enable_metrics = false
      enable_relay   = false
    }
    managed_prometheus {
      enabled = true
    }
  }
  network_policy {
    enabled  = false
    provider = "PROVIDER_UNSPECIFIED"
  }
  node_config {
    boot_disk_kms_key           = null
    disk_size_gb                = 100
    disk_type                   = "pd-balanced"
    enable_confidential_storage = false
    flex_start                  = false
    image_type                  = "COS_CONTAINERD"
    labels                      = {}
    local_ssd_count             = 0
    local_ssd_encryption_mode   = null
    logging_variant             = "DEFAULT"
    machine_type                = "e2-standard-4"
    max_run_duration            = null
    metadata = {
      disable-legacy-endpoints = "true"
    }
    min_cpu_platform = null
    node_group       = null
    oauth_scopes     = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible      = false
    resource_labels = {
      goog-gke-node-pool-provisioning-model = "on-demand"
    }
    resource_manager_tags = {}
    service_account       = "default"
    spot                  = false
    storage_pools         = []
    tags                  = []
    boot_disk {
      disk_type              = "pd-balanced"
      provisioned_iops       = 0
      provisioned_throughput = 0
      size_gb                = 100
    }
    kubelet_config {
      allowed_unsafe_sysctls                 = []
      container_log_max_files                = 0
      container_log_max_size                 = null
      cpu_cfs_quota                          = false
      cpu_cfs_quota_period                   = null
      cpu_manager_policy                     = null
      eviction_max_pod_grace_period_seconds  = 0
      image_gc_high_threshold_percent        = 0
      image_gc_low_threshold_percent         = 0
      image_maximum_gc_age                   = null
      image_minimum_gc_age                   = null
      insecure_kubelet_readonly_port_enabled = "FALSE"
      max_parallel_image_pulls               = 2
      pod_pids_limit                         = 0
      single_process_oom_kill                = false
    }
    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }
  }
  node_pool {
    max_pods_per_node = 110
    name              = "default-pool"
    name_prefix       = null
    node_locations    = ["us-west1-c"]
    version           = "1.34.1-gke.3971001"
    autoscaling {
      location_policy      = "BALANCED"
      max_node_count       = 3
      min_node_count       = 1
      total_max_node_count = 0
      total_min_node_count = 0
    }
    management {
      auto_repair  = true
      auto_upgrade = true
    }
    network_config {
      create_pod_range     = false
      enable_private_nodes = false
      pod_ipv4_cidr_block  = "10.16.0.0/14"
      pod_range            = "gke-cluster-1-pods-5bd58a3f"
    }
    node_config {
      boot_disk_kms_key           = null
      disk_size_gb                = 100
      disk_type                   = "pd-balanced"
      enable_confidential_storage = false
      flex_start                  = false
      image_type                  = "COS_CONTAINERD"
      labels                      = {}
      local_ssd_count             = 0
      local_ssd_encryption_mode   = null
      logging_variant             = "DEFAULT"
      machine_type                = "e2-standard-4"
      max_run_duration            = null
      metadata = {
        disable-legacy-endpoints = "true"
      }
      min_cpu_platform = null
      node_group       = null
      oauth_scopes     = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
      preemptible      = false
      resource_labels = {
        goog-gke-node-pool-provisioning-model = "on-demand"
      }
      resource_manager_tags = {}
      service_account       = "default"
      spot                  = false
      storage_pools         = []
      tags                  = []
      boot_disk {
        disk_type              = "pd-balanced"
        provisioned_iops       = 0
        provisioned_throughput = 0
        size_gb                = 100
      }
      kubelet_config {
        allowed_unsafe_sysctls                 = []
        container_log_max_files                = 0
        container_log_max_size                 = null
        cpu_cfs_quota                          = false
        cpu_cfs_quota_period                   = null
        cpu_manager_policy                     = null
        eviction_max_pod_grace_period_seconds  = 0
        image_gc_high_threshold_percent        = 0
        image_gc_low_threshold_percent         = 0
        image_maximum_gc_age                   = null
        image_minimum_gc_age                   = null
        insecure_kubelet_readonly_port_enabled = "FALSE"
        max_parallel_image_pulls               = 2
        pod_pids_limit                         = 0
        single_process_oom_kill                = false
      }
      shielded_instance_config {
        enable_integrity_monitoring = true
        enable_secure_boot          = false
      }
    }
    upgrade_settings {
      max_surge       = 1
      max_unavailable = 0
      strategy        = "SURGE"
    }
  }
  node_pool_auto_config {
    resource_manager_tags = {}
    node_kubelet_config {
      insecure_kubelet_readonly_port_enabled = "FALSE"
    }
  }
  node_pool_defaults {
    node_config_defaults {
      insecure_kubelet_readonly_port_enabled = "FALSE"
      logging_variant                        = "DEFAULT"
    }
  }
  notification_config {
    pubsub {
      enabled = false
      topic   = null
    }
  }
  pod_autoscaling {
    hpa_profile = "PERFORMANCE"
  }
  private_cluster_config {
    enable_private_endpoint     = false
    enable_private_nodes        = false
    master_ipv4_cidr_block      = null
    private_endpoint_subnetwork = null
    master_global_access_config {
      enabled = false
    }
  }
  rbac_binding_config {
    enable_insecure_binding_system_authenticated   = true
    enable_insecure_binding_system_unauthenticated = true
  }
  release_channel {
    channel = "REGULAR"
  }
  secret_manager_config {
    enabled = false
  }
  security_posture_config {
    mode               = "BASIC"
    vulnerability_mode = "VULNERABILITY_MODE_UNSPECIFIED"
  }
  service_external_ips_config {
    enabled = false
  }
}

import {
  id = "projects/qwiklabs-gcp-02-f2dfa963bd61/locations/us-west1-c/clusters/cluster-1"
  to = google_container_cluster.cluster_1
}

resource "google_container_node_pool" "default_pool" {
  cluster            = "cluster-1"
  initial_node_count = 1
  location           = "us-west1-c"
  max_pods_per_node  = 110
  name               = "default-pool"
  name_prefix        = null
  node_locations     = ["us-west1-c"]
  project            = "qwiklabs-gcp-02-f2dfa963bd61"
  version            = "1.34.1-gke.3971001"
  autoscaling {
    location_policy      = "BALANCED"
    max_node_count       = 3
    min_node_count       = 1
    total_max_node_count = 0
    total_min_node_count = 0
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  network_config {
    create_pod_range     = false
    enable_private_nodes = false
    pod_ipv4_cidr_block  = "10.16.0.0/14"
    pod_range            = "gke-cluster-1-pods-5bd58a3f"
  }
  node_config {
    boot_disk_kms_key           = null
    disk_size_gb                = 100
    disk_type                   = "pd-balanced"
    enable_confidential_storage = false
    flex_start                  = false
    image_type                  = "COS_CONTAINERD"
    labels                      = {}
    local_ssd_count             = 0
    local_ssd_encryption_mode   = null
    logging_variant             = "DEFAULT"
    machine_type                = "e2-standard-4"
    max_run_duration            = null
    metadata = {
      disable-legacy-endpoints = "true"
    }
    min_cpu_platform = null
    node_group       = null
    oauth_scopes     = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible      = false
    resource_labels = {
      goog-gke-node-pool-provisioning-model = "on-demand"
    }
    resource_manager_tags = {}
    service_account       = "default"
    spot                  = false
    storage_pools         = []
    tags                  = []
    boot_disk {
      disk_type              = "pd-balanced"
      provisioned_iops       = 0
      provisioned_throughput = 0
      size_gb                = 100
    }
    kubelet_config {
      allowed_unsafe_sysctls                 = []
      container_log_max_files                = 0
      container_log_max_size                 = null
      cpu_cfs_quota                          = false
      cpu_cfs_quota_period                   = null
      cpu_manager_policy                     = null
      eviction_max_pod_grace_period_seconds  = 0
      image_gc_high_threshold_percent        = 0
      image_gc_low_threshold_percent         = 0
      image_maximum_gc_age                   = null
      image_minimum_gc_age                   = null
      insecure_kubelet_readonly_port_enabled = "FALSE"
      max_parallel_image_pulls               = 2
      pod_pids_limit                         = 0
      single_process_oom_kill                = false
    }
    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }
  }
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
    strategy        = "SURGE"
  }
}

import {
  id = "qwiklabs-gcp-02-f2dfa963bd61/us-west1-c/cluster-1/default-pool"
  to = google_container_node_pool.default_pool
}
