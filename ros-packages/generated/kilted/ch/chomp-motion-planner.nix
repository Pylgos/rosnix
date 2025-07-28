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
  version = "2.13.2-2";
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
        rev = "9f4d61cb6d757efe0cfb0c997bdb078aac678dc0";
        hash = "sha256-yqTp0+AN2WJeLQk5kr7gxD9ejkMJ4UH6Xb/aj/qoYQ8=";
      };
    };
  });
  meta = {
    description = "chomp_motion_planner";
  };
})
