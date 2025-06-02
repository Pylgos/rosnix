{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostic_remote_logging";
  version = "4.4.6-1";
  src = finalAttrs.passthru.sources."diagnostic_remote_logging";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "curl" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_remote_logging" = substituteSource {
      src = fetchgit {
        name = "diagnostic_remote_logging-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "b76821cd9891526a8862e41fe2d9700ae0bac147";
        hash = "sha256-4yA26dy7od7LaANOuQm7vzRuj/P1zs+2eUuC59ixTv0=";
      };
    };
  });
  meta = {
    description = "diagnostic_remote_logging";
  };
})
