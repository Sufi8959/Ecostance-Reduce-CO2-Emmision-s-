class AppCustomSettings {
  AppCustomSettings({required this.notificationEnabled});
  bool notificationEnabled;

  AppCustomSettings copyWith({
    bool? notificationEnabled,
  }) {
    return AppCustomSettings(
        notificationEnabled: notificationEnabled ?? this.notificationEnabled);
  }
}
