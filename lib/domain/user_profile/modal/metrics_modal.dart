class DashboardMetricsModal {
  int ghgReduced;
  int treesPlanted;
  int projectsSupportedCount;

  DashboardMetricsModal({
    required this.ghgReduced,
    required this.treesPlanted,
    required this.projectsSupportedCount,
  });
  factory DashboardMetricsModal.zero() => DashboardMetricsModal(
      ghgReduced: 0, treesPlanted: 0, projectsSupportedCount: 0);
}
