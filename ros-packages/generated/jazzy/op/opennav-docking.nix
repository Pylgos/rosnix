{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-graceful-controller,
  nav2-msgs,
  nav2-util,
  opennav-docking-core,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."opennav_docking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles builtin-interfaces geometry-msgs nav2-graceful-controller nav2-msgs nav2-util nav-msgs opennav-docking-core pluginlib rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs tf2-ros yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking" = substituteSource {
      src = fetchgit {
        name = "opennav_docking-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d84886adffc1efd39b2bb961c0a2b25a3d3c0843";
        hash = "sha256-cevmvYCJSjyCg1y4vxpXJL7kZkzOG0EuYWhjiDZjsAI=";
      };
    };
  });
  meta = {
    description = "A Task Server for robot charger docking";
  };
})
