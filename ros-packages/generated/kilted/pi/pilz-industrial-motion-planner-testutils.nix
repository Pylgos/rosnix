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
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."pilz_industrial_motion_planner_testutils";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module moveit-common moveit-core moveit-msgs rclcpp tf2-eigen ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module moveit-common moveit-core moveit-msgs rclcpp tf2-eigen ];
  passthru.sources = mkSourceSet (sources: {
    "pilz_industrial_motion_planner_testutils" = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "50750fce9ed1c4e1570be9819ff9e716522285cf";
        hash = "sha256-7KIEflRWmXKOooQv2m5+/kSjBK7qz3T+8J5H+0gMFQw=";
      };
    };
  });
  meta = {
    description = "Helper scripts and functionality to test industrial motion generation";
  };
})
