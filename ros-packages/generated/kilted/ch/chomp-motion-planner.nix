{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  rclcpp,
  rosSystemPackages,
  rsl,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "chomp_motion_planner";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."chomp_motion_planner";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-common moveit-core rclcpp rsl trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-common moveit-core rclcpp rsl trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "chomp_motion_planner" = substituteSource {
      src = fetchgit {
        name = "chomp_motion_planner-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c0811f40a0e2b5ba8c6f48bc399da7b57e0ad33a";
        hash = "sha256-BVno7246mNrTJElqf815d102ikzYkOyPnX3RdqWx1rA=";
      };
    };
  });
  meta = {
    description = "chomp_motion_planner";
  };
})
