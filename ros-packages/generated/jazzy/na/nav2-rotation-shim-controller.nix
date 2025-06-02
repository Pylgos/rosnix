{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-controller,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-regulated-pure-pursuit-controller,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_rotation_shim_controller";
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_rotation_shim_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs nav2-common nav2-controller nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp tf2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-controller nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp tf2 ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common nav2-controller nav2-regulated-pure-pursuit-controller ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_rotation_shim_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_rotation_shim_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "82fec9af55a4657905200a4cb0b3e7fd3f217655";
        hash = "sha256-gYjQ+RdD1GaQBmdcxhYqTbtRDEft2Ow0M5w6wyCXA9A=";
      };
    };
  });
  meta = {
    description = "Rotation Shim Controller";
  };
})
