{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-agnocast-wrapper,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-kalman-filter,
  autoware-lint-common,
  autoware-localization-util,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-system,
  buildAmentCmakePackage,
  diagnostic-msgs,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_ekf_localizer";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_ekf_localizer";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-agnocast-wrapper autoware-internal-debug-msgs autoware-kalman-filter autoware-localization-util autoware-utils-geometry autoware-utils-logging autoware-utils-system diagnostic-msgs geometry-msgs nav-msgs rclcpp rclcpp-components std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ autoware-agnocast-wrapper autoware-internal-debug-msgs autoware-kalman-filter autoware-localization-util autoware-utils-geometry autoware-utils-logging autoware-utils-system diagnostic-msgs geometry-msgs nav-msgs rclcpp rclcpp-components std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common launch-testing-ament-cmake ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_ekf_localizer" = substituteSource {
      src = fetchgit {
        name = "autoware_ekf_localizer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "459be0f444a58e82ea285c925512637114046ecc";
        hash = "sha256-yMsc5NguxlX101gkamwo6ioaf8mxMb+ibowDf0pHQ+s=";
      };
    };
  });
  meta = {
    description = "The autoware_ekf_localizer package";
  };
})
