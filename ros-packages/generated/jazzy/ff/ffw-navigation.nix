{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-bringup,
  nav2-simple-commander,
  navigation2,
  rclcpp,
  rosSystemPackages,
  rviz2,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_navigation";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."ffw_navigation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ behaviortree-cpp geometry-msgs nav2-bringup nav2-simple-commander nav-msgs navigation2 rclcpp rviz2 slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp geometry-msgs nav2-bringup nav2-simple-commander nav-msgs navigation2 rclcpp rviz2 slam-toolbox ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_navigation" = substituteSource {
      src = fetchgit {
        name = "ffw_navigation-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "43ae69c6136bd68cd0814420f56cd94fd1be258e";
        hash = "sha256-uAh7y4mA3vfPHpQBV1if/k7KEyIrA0XdA+ec+QQEncM=";
      };
    };
  });
  meta = {
    description = "ffw_navigation";
  };
})
