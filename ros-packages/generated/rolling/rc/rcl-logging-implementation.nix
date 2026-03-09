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
  rcl-logging-noop,
  rcl-logging-spdlog,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_implementation";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rcl_logging_implementation";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-logging-interface rcl-logging-spdlog rcpputils rcutils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcl-logging-spdlog rcpputils rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcl-logging-noop ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_implementation" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_implementation-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "2352375957e397d8a08cf10a47e6d99ba449ef1f";
        hash = "sha256-o3IcjJSEOAQCnkqENIKckCE/A5Tw8mnlbKCTiNOn1CQ=";
      };
    };
  });
  meta = {
    description = "\n    Provides the ability to load logging implementations at runtime.\n    This package acts as an abstraction layer between rcl and the actual\n    logging implementation (e.g., spdlog, noop, or custom implementations).\n  ";
  };
})
