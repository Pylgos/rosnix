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
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_lifecycle_manager";
  version = "1.3.11-1";
  src = finalAttrs.passthru.sources."nav2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ bondcpp diagnostic-updater geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util rclcpp-action rclcpp-lifecycle std-msgs std-srvs tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bondcpp diagnostic-updater geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util rclcpp-action rclcpp-lifecycle std-msgs std-srvs tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "nav2_lifecycle_manager-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "1d062d47216c2f09932ed14c97886cf5df9242dd";
        hash = "sha256-tgxEu72Gj8ihVHZTVNBqvbYCTNiXcC3gEH38+qGQRiE=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the Navigation 2 system";
  };
})
