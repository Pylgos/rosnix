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
  version = "2.0.15-1";
  src = finalAttrs.passthru.sources."plansys2_domain_expert";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-core plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_domain_expert" = substituteSource {
      src = fetchgit {
        name = "plansys2_domain_expert-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "7b321911e4e2c36ee2dcdebfbbc74b12cb7a5cb9";
        hash = "sha256-p2HwsN3mu+2CzI6u3Mdo/efJdM0L3cIhWsvnITIV4io=";
      };
    };
  });
  meta = {
    description = "This package contains the Domain Expert module for the ROS2 Planning System";
  };
})
