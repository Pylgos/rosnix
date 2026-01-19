{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  moveit-configs-utils,
  moveit-core,
  moveit-resources-panda-moveit-config,
  moveit-ros-move-group,
  moveit-ros-planning,
  moveit-task-constructor-core,
  moveit-task-constructor-msgs,
  pluginlib,
  rclcpp-action,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_capabilities";
  version = "0.1.4-2";
  src = finalAttrs.passthru.sources."moveit_task_constructor_capabilities";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-core moveit-ros-move-group moveit-ros-planning moveit-task-constructor-core moveit-task-constructor-msgs pluginlib rclcpp-action std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-core moveit-ros-move-group moveit-ros-planning moveit-task-constructor-core moveit-task-constructor-msgs pluginlib rclcpp-action std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gtest launch-testing launch-testing-ament-cmake moveit-configs-utils moveit-resources-panda-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_capabilities" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_capabilities-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "225d7bc4b918f8077fc30496141089e7e9d9087b";
        hash = "sha256-s8Xd3eQewHSpFNCN+tcoPkyar3JaIhJ6+s8T4571fKY=";
      };
    };
  });
  meta = {
    description = "\n	MoveGroupCapabilites to interact with MoveIt\n	";
  };
})
