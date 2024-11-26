{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-msgs,
  plansys2-pddl-parser,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_core";
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs plansys2-pddl-parser pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "plansys2_core" = substituteSource {
        src = fetchgit {
          name = "plansys2_core-source";
          url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
          rev = "cd4a197e608b3b5bae9833ac8125d306a3461d44";
          hash = "sha256-fT33KY8/1WIlwJcQfu1ABWhvLEUs/ze7R8OGuiACnGQ=";
        };
      };
    });
  };
  meta = {
    description = "This package contains the PDDL-based core for the ROS2 Planning System";
  };
})
