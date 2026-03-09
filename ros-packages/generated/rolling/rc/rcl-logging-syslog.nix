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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_syslog";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."rcl_logging_syslog";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-logging-interface rcpputils rcutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "rsyslog" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcpputils rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rsyslog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_syslog" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_syslog-source";
        url = "https://github.com/ros2-gbp/rcl_logging_syslog-release.git";
        rev = "842206b9c3256cfac112aa2cb8c6cd519399c278";
        hash = "sha256-VtTcyB4Y7MrFtBujATKdD3cGDUeaLNEUMthXi/2ko5U=";
      };
    };
  });
  meta = {
    description = "Implementation of rcl_logging API for an syslog/rsyslog backend.";
  };
})
