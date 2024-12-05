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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_bringup";
  version = "2.0.15-1";
  src = finalAttrs.passthru.sources."plansys2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ launch-ros plansys2-domain-expert plansys2-executor plansys2-lifecycle-manager plansys2-planner plansys2-problem-expert rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_bringup" = substituteSource {
      src = fetchgit {
        name = "plansys2_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "de10fb881cd0df6edcd3e5cd7d685b8638ccf248";
        hash = "sha256-VpTUjiX10piXkKNDrx5FgSEg16C4eCqTsUvIcCB2vNY=";
      };
    };
  });
  meta = {
    description = "Bringup scripts and configurations for the ROS2 Planning System";
  };
})
