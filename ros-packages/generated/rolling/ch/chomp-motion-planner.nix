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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."chomp_motion_planner";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common moveit-core rclcpp rsl trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "chomp_motion_planner" = substituteSource {
      src = fetchgit {
        name = "chomp_motion_planner-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7e2bf2bd5ffcee4a9f91cad6c4e159231f123047";
        hash = "sha256-ncLtL7I6jJ6E2ea/fhHTb1xRSNRCm5e2sBsKpDXQ3W4=";
      };
    };
  });
  meta = {
    description = "chomp_motion_planner";
  };
})
