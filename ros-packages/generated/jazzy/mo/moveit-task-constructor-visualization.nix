{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  libyaml-vendor,
  mkSourceSet,
  moveit-core,
  moveit-ros-visualization,
  moveit-task-constructor-core,
  moveit-task-constructor-msgs,
  rclcpp,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_visualization";
  version = "0.1.4-1";
  src = finalAttrs.passthru.sources."moveit_task_constructor_visualization";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ libyaml-vendor moveit-core moveit-ros-visualization moveit-task-constructor-core moveit-task-constructor-msgs rclcpp rviz2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ libyaml-vendor moveit-core moveit-ros-visualization moveit-task-constructor-core moveit-task-constructor-msgs rclcpp rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_visualization" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_visualization-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "cc07b4d2e2d2104a826177d2c8b835d238c6d495";
        hash = "sha256-acRoXyNE0WIpzB99GpFpwpLrmbbLcP47uVOmkqjlBTg=";
      };
    };
  });
  meta = {
    description = "Visualization tools for MoveIt Task Pipeline";
  };
})
