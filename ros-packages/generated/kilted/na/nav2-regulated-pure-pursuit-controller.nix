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
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_regulated_pure_pursuit_controller";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."nav2_regulated_pure_pursuit_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rcl-interfaces rclcpp rclcpp-lifecycle std-msgs tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rcl-interfaces rclcpp rclcpp-lifecycle std-msgs tf2 tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_regulated_pure_pursuit_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_regulated_pure_pursuit_controller-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "ae53e8ca11ec608428d2ad2147df7799f03fb90c";
        hash = "sha256-g2X2+RGLm77dhjTBR2b0Tpm9h+aNnP4CMgrrAUBOKk8=";
      };
    };
  });
  meta = {
    description = "Regulated Pure Pursuit Controller";
  };
})
