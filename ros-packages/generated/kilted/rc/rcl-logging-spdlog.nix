{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcl-logging-interface,
  rcpputils,
  rcutils,
  rosSystemPackages,
  spdlog-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_spdlog";
  version = "3.2.4-1";
  src = finalAttrs.passthru.sources."rcl_logging_spdlog";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-logging-interface rcpputils rcutils spdlog-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "spdlog" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcpputils rcutils spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "spdlog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_spdlog" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_spdlog-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "6b29d4f31f0a882ac4bc0052682f31fe3bb8df6b";
        hash = "sha256-QQMnhsYMlCoMpl+XocYYx9avc/tt+RP9/rCy/K6j28I=";
      };
    };
  });
  meta = {
    description = "Implementation of rcl_logging API for an spdlog backend.";
  };
})
