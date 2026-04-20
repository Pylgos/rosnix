{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  controller-manager,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_capabilities";
  version = "0.1.5-1";
  src = finalAttrs.passthru.sources."moveit_task_constructor_capabilities";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ moveit-core moveit-ros-move-group moveit-ros-planning moveit-task-constructor-core moveit-task-constructor-msgs pluginlib rclcpp-action std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-core moveit-ros-move-group moveit-ros-planning moveit-task-constructor-core moveit-task-constructor-msgs pluginlib rclcpp-action std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gtest controller-manager launch-testing launch-testing-ament-cmake moveit-configs-utils moveit-resources-panda-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_capabilities" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_capabilities-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "d0102e7840adc13210e496e2594d5b04f4c0d807";
        hash = "sha256-v/yqFKXid8cPELvHMpd7Meu0REnkaB0APpoFFM69mug=";
      };
    };
  });
  meta = {
    description = "\n	MoveGroupCapabilites to interact with MoveIt\n	";
  };
})
