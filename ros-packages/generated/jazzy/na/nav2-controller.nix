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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp rclcpp-action std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "283cc3a325ae31fde1d2be8ac078afcee7c2944a";
        hash = "sha256-b24Xe4CHJVxQBUayVeLg2/0hapr/TlL1CCqEslvWTQ4=";
      };
    };
  });
  meta = {
    description = "Controller action interface";
  };
})
