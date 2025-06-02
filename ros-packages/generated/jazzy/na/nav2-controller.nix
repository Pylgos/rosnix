{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_controller";
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp rclcpp-action std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp rclcpp-action std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "dd59c9cc06f4997ab03d2273993a3cd327365521";
        hash = "sha256-o4bVgLsMq0hM+XQdqbU01rIXPixX2XKfJvbxkVTMypU=";
      };
    };
  });
  meta = {
    description = "Controller action interface";
  };
})
