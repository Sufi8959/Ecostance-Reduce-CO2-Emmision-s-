class DeviceInfoModal {
  DeviceInfoModal({
    required this.ua,
    required this.browser,
    required this.engine,
    required this.os,
    required this.device,
  });

  final String ua;
  final BrowserModal? browser;
  final EngineModal? engine;
  final EngineModal? os;
  final DeviceModal? device;
}

class BrowserModal {
  BrowserModal({
    required this.name,
    required this.version,
    required this.major,
  });

  final String name;
  final String version;
  final String major;
}

class DeviceModal {
  DeviceModal({
    required this.vendor,
    required this.model,
  });

  final String vendor;
  final String model;
}

class EngineModal {
  EngineModal({
    required this.name,
    required this.version,
  });

  final String name;
  final String version;
}
