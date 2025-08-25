{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  bondcpp,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav2-common,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_lifecycle_manager";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ bondcpp diagnostic-updater geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util rclcpp rclcpp-action rclcpp-components std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bondcpp diagnostic-updater geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util rclcpp rclcpp-action rclcpp-components std-srvs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "nav2_lifecycle_manager-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "59bfbb6ef4fb9f57cb3bda69d2e157e713e872e6";
        hash = "sha256-Ca03/4TCKqWbCEjWXFeg5a+HIOu1p5u9ivv7T7YML/8=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the Navigation 2 system";
  };
})
