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
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-msgs plansys2-pddl-parser pluginlib rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs plansys2-pddl-parser pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_core" = substituteSource {
      src = fetchgit {
        name = "plansys2_core-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "916afb584d135ae028e19fcd8639109652183f0c";
        hash = "sha256-AbZHHfIlcJV9SGsbZRiAKb2Ln/78RVneaTBs9XoGBn4=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based core  for the ROS2 Planning System";
  };
})
