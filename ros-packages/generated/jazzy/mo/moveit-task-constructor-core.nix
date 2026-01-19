{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-testing-ament-cmake,
  mkSourceSet,
  moveit-configs-utils,
  moveit-core,
  moveit-planners,
  moveit-resources-fanuc-moveit-config,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-task-constructor-msgs,
  py-binding-tools,
  rclcpp,
  rosSystemPackages,
  rviz-marker-tools,
  substituteSource,
  tf2-eigen,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_core";
  version = "0.1.4-3";
  src = finalAttrs.passthru.sources."moveit_task_constructor_core";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface moveit-task-constructor-msgs py-binding-tools rclcpp rviz-marker-tools tf2-eigen visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface moveit-task-constructor-msgs py-binding-tools rclcpp rviz-marker-tools tf2-eigen visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest launch-testing-ament-cmake moveit-configs-utils moveit-planners moveit-resources-fanuc-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_core" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_core-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "2792f4615258d377d7979d8cce4378543d6bc80a";
        hash = "sha256-Jijq+shdSUWbxwuEPRFpX6o9N2ZDeiFB9vvbenSMTKU=";
      };
      substitutions = [
        {
          path = "src/scope_guard/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${sources."moveit_task_constructor_core/Catch2"}";
        }
      ];
    };
    "moveit_task_constructor_core/Catch2" = substituteSource {
      src = fetchgit {
        name = "Catch2-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "5c88067bd339465513af4aec606bd2292f1b594a";
        hash = "sha256-LUR2RcEvlzW/xMDBQQANTWOs2bNIiDHsWtWwAwThAIw=";
      };
    };
  });
  meta = {
    description = "MoveIt Task Pipeline";
  };
})
