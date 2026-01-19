{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-core,
  pluginlib,
  popf,
  rclcpp,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_popf_plan_solver";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_popf_plan_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-core pluginlib popf rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-core pluginlib popf rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_popf_plan_solver" = substituteSource {
      src = fetchgit {
        name = "plansys2_popf_plan_solver-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "e3399643954dbf3267c8bedf7e3c47facd2a0165";
        hash = "sha256-y2/Tc3mgK28d583sfh1bGk/yYK0OHtm6/1hAzT2/w30=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based Planner module for the ROS2 Planning System";
  };
})
