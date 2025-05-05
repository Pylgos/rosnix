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
  lifecycle-msgs,
  mkSourceSet,
  plansys2-core,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-popf-plan-solver,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_domain_expert";
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_domain_expert";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ lifecycle-msgs plansys2-core plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver rclcpp-action std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_domain_expert" = substituteSource {
      src = fetchgit {
        name = "plansys2_domain_expert-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "e1c7fb8c9814ba93b24c0d36956c71c18291d5a2";
        hash = "sha256-Y2DdZ8d5odWG1HI1hPWFRrDS9rRzTYVcK5O4G8c3e5I=";
      };
    };
  });
  meta = {
    description = "This package contains the Domain Expert module for the ROS2 Planning System";
  };
})
