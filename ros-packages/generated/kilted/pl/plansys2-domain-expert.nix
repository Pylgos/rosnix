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
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_domain_expert";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."plansys2_domain_expert";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp plansys2-core plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver rclcpp rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp plansys2-core plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver rclcpp rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common lifecycle-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_domain_expert" = substituteSource {
      src = fetchgit {
        name = "plansys2_domain_expert-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "bec46a24376dfddde6d254a64466e1a5690ca14f";
        hash = "sha256-VcomkaWPyYiqVP9KD3AhopdYE44eKRe/A9rmsxPpbbA=";
      };
    };
  });
  meta = {
    description = "This package contains the Domain Expert module for the ROS2 Planning System";
  };
})
