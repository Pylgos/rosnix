{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  launch-param-builder,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-fanuc-description,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-description,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning,
  orocos-kdl-vendor,
  pluginlib,
  ros-testing,
  rosSystemPackages,
  rsl,
  substituteSource,
  tf2,
  tf2-kdl,
  urdfdom,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_kinematics";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_kinematics";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ class-loader generate-parameter-library moveit-common moveit-core moveit-msgs moveit-ros-planning orocos-kdl-vendor pluginlib rsl tf2 tf2-kdl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-lxml" ]; };
  checkInputs = [ ament-cmake-gtest launch-param-builder moveit-configs-utils moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_kinematics" = substituteSource {
      src = fetchgit {
        name = "moveit_kinematics-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f3f4c97f953f52956bb2e0415570193e6cd90fc5";
        hash = "sha256-l4Z0gXDSTBykwBWJxSQO8nR+VC8k4J1D12+XHmhWFqc=";
      };
    };
  });
  meta = {
    description = "Package for all inverse kinematics solvers in MoveIt";
  };
})
