enum Flavor {
  develop,
  staging,
  production,
}

enum BuildMode { debug, profile, release }

class BuildConfig {
  BuildConfig._internal();

  Flavor? _flavor;

  Flavor get flavor {
    return _flavor ?? Flavor.production;
  }

  set flavor(Flavor flavor) {
    if (_flavor != null) {
      return;
    } else {
      _flavor = flavor;
    }
  }

  BuildMode mode = (() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.release;
    }
    var mode = BuildMode.profile;
    assert(() {
      mode = BuildMode.debug;
      return true;
    }());
    return mode;
  }());

  bool get isRelease => mode == BuildMode.release;
  bool get isProfile => mode == BuildMode.profile;
  bool get isDebug => mode == BuildMode.debug;
  bool get isProduction => flavor == Flavor.production;
  bool get isStaging => flavor == Flavor.staging;
  bool get isDevelop => flavor == Flavor.develop;
}

final buildConfig = BuildConfig._internal();