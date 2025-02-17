{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pilz_industrial_motion_planner_testutils";
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."pilz_industrial_motion_planner_testutils";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-msgs rclcpp tf2-eigen ];
  passthru.sources = mkSourceSet (sources: {
    "pilz_industrial_motion_planner_testutils" = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "29f0aab7af89d8e33b57b51ea3c4d59cf410b133";
        hash = "sha256-WZWG4susiNgSZ+yQNiMmU+g6DZBKbXWSe1ww24oN4C0=";
      };
    };
  });
  meta = {
    description = "Helper scripts and functionality to test industrial motion generation";
  };
})
