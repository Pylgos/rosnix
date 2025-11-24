{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-logging-interface,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_noop";
  version = "3.3.2-1";
  src = finalAttrs.passthru.sources."rcl_logging_noop";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-logging-interface rcutils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_noop" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_noop-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "476d862fad0b1c8e87e6597ef7d8883eef0ac4e8";
        hash = "sha256-Xkr7aOR50qSWGcEnmqeCe24yhGY2KyijeyJMFmKlNsY=";
      };
    };
  });
  meta = {
    description = "An rcl logger implementation that doesn't do anything with log messages.";
  };
})
