{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-lifecycle-manager,
  plansys2-planner,
  plansys2-problem-expert,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_bringup";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-ros plansys2-domain-expert plansys2-executor plansys2-lifecycle-manager plansys2-planner plansys2-problem-expert rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros plansys2-domain-expert plansys2-executor plansys2-lifecycle-manager plansys2-planner plansys2-problem-expert rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_bringup" = substituteSource {
      src = fetchgit {
        name = "plansys2_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "6cbd2bd2d1dec2fe7f839a28de9dd413a0d575b2";
        hash = "sha256-zFzQ7c2lXO0gPG50GYBomuxIwNo7l5NmmLEXWcLQRcM=";
      };
    };
  });
  meta = {
    description = "Bringup scripts and configurations for the ROS2 Planning System";
  };
})
