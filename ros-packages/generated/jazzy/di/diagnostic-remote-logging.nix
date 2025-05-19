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
  version = "4.2.4-1";
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
        rev = "d333daa6eaf8b87b43f0e9af57d43bf5108ce2e2";
        hash = "sha256-0Gz5psm2Z1UCfcoe7FxVX5VVM7Dw9DqfDUBS29rpmXA=";
      };
    };
  });
  meta = {
    description = "diagnostic_remote_logging";
  };
})
