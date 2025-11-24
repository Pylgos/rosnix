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
  version = "3.3.2-1";
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
        rev = "99d2d5267ee08d4f4ccc4e872ccef567ce0db0f0";
        hash = "sha256-fZfY0w8xJZm7fmjd4OKtX0iI7yDlC5Psl+PzbF6k0wU=";
      };
    };
  });
  meta = {
    description = "Implementation of rcl_logging API for an spdlog backend.";
  };
})
