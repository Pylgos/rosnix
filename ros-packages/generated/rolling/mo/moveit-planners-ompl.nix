{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-moveit-config,
  moveit-resources-pr2-description,
  moveit-ros-planning,
  ompl,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_planners_ompl";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_planners_ompl";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-common moveit-core moveit-msgs moveit-ros-planning ompl pluginlib rclcpp tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libomp-dev" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-msgs moveit-ros-planning ompl pluginlib rclcpp tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libomp-dev" ]; };
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config moveit-resources-pr2-description tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_ompl" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_ompl-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "38eb2d165c4102b2700577bf04a0ec058e4e63f4";
        hash = "sha256-mKoU58dg3hCl3ns9NuLCEO4lW/PBXuBzIJj+boMwQRM=";
      };
    };
  });
  meta = {
    description = "MoveIt interface to OMPL";
  };
})
