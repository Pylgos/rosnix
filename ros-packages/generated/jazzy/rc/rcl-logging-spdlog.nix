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
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."rcl_logging_spdlog";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-logging-interface rcpputils spdlog-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "spdlog" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcpputils spdlog-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "spdlog" ]; };
  depsTargetTargetPropagated = [ rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_spdlog" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_spdlog-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "b32a3621203c6a60293c48e7893eeb85a6ddae36";
        hash = "sha256-h1KWhkNfvof+dgUXU97ke/Cb3HsNq71hA+5t1J5EKFc=";
      };
    };
  });
  meta = {
    description = "Implementation of rcl_logging API for an spdlog backend.";
  };
})
