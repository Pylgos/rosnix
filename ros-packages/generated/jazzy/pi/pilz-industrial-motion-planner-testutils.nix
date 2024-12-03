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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."pilz_industrial_motion_planner_testutils";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-msgs rclcpp tf2-eigen ];
  passthru.sources = mkSourceSet (sources: {
    "pilz_industrial_motion_planner_testutils" = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5149a38ea955e00826e9620ee8c1742c845fe3f2";
        hash = "sha256-M6TBx86IE77a4rjEhOz3/V1D2pJpjVwOc8mKOkTwPns=";
      };
    };
  });
  meta = {
    description = "Helper scripts and functionality to test industrial motion generation";
  };
})
