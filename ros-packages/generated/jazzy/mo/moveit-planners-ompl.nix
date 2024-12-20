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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_planners_ompl";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-common moveit-core moveit-msgs moveit-ros-planning ompl pluginlib rclcpp tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libomp-dev" ]; };
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config moveit-resources-pr2-description tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners_ompl" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_ompl-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9030caefb48b94b2905a7f85d25f3a31063897f5";
        hash = "sha256-cVXm4lfx+8xKkTq7l+D2JDLtkxyMYO/v87wwZI1KgzM=";
      };
    };
  });
  meta = {
    description = "MoveIt interface to OMPL";
  };
})
