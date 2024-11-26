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
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."rcl_logging_spdlog";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcpputils rcutils spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "spdlog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_spdlog" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_spdlog-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "335167127c4e5747d4cc8195a0f838cf085eda64";
        hash = "sha256-MCT5eIa8paDTu2MwG76OtyJnFBJxTLZiEgfPdv6YaVM=";
      };
    };
  });
  meta = {
    description = "Implementation of rcl_logging API for an spdlog backend.";
  };
})
