{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-problem-expert,
  popf,
  rclcpp,
  rclcpp-action,
  rclcpp-cascade-lifecycle,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "plansys2_tests" = substituteSource {
      src = fetchgit {
        name = "plansys2_tests-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "285f7fc1e476ffc1a3f8b9e59a4ac5d231f20f7a";
        hash = "sha256-rPwZFs7VpoSapy3RdmhWh8LJFwUTov5tuvyxldOFGyg=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_tests";
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp behaviortree-cpp lifecycle-msgs plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "This package contains the tests package for the ROS2 Planning System";
  };
})
