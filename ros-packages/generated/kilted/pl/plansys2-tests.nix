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
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-problem-expert,
  popf,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_tests";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_tests";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-executor plansys2-msgs popf rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-executor plansys2-msgs popf rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common plansys2-domain-expert plansys2-pddl-parser plansys2-planner plansys2-problem-expert ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_tests" = substituteSource {
      src = fetchgit {
        name = "plansys2_tests-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "c61790fe2e0332221506daa9422239f9bcae74cc";
        hash = "sha256-FuMNVcGkcN364bBPL0Foktu58Fl8p6dsOBT/QIaPPbg=";
      };
    };
  });
  meta = {
    description = "This package contains the tests package for the ROS2 Planning System";
  };
})
