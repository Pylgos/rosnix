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
  version = "2.12.3-1";
  src = finalAttrs.passthru.sources."moveit_kinematics";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ class-loader generate-parameter-library moveit-common moveit-core moveit-msgs moveit-ros-planning orocos-kdl-vendor pluginlib rsl tf2 tf2-kdl urdfdom ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-lxml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ class-loader generate-parameter-library moveit-common moveit-core moveit-msgs moveit-ros-planning orocos-kdl-vendor pluginlib rsl tf2 tf2-kdl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-lxml" ]; };
  checkInputs = [ ament-cmake-gtest launch-param-builder moveit-configs-utils moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_kinematics" = substituteSource {
      src = fetchgit {
        name = "moveit_kinematics-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a6a3d4a8b38dc0495299c588913bff74cc13787a";
        hash = "sha256-BPzRhv9h6IAR2zPbZ7maG8LbyN7EUCLDxUQVsHbb204=";
      };
    };
  });
  meta = {
    description = "Package for all inverse kinematics solvers in MoveIt";
  };
})
