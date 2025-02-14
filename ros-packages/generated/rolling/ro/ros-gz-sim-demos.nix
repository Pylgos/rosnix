{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-sim-vendor,
  image-transport-plugins,
  mkSourceSet,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  rosSystemPackages,
  rqt-image-view,
  rqt-plot,
  rqt-topic,
  rviz-imu-plugin,
  rviz2,
  sdformat-urdf,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim_demos";
  version = "2.1.4-1";
  src = finalAttrs.passthru.sources."ros_gz_sim_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-sim-vendor image-transport-plugins robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim rqt-image-view rqt-plot rqt-topic rviz2 rviz-imu-plugin sdformat-urdf tf2-ros xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim_demos" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim_demos-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "19d87b91c5e36cd69eeea999d66e9d7a5bf36983";
        hash = "sha256-WjAchSzC24iGr4W8/g6UjhHtxbhurvxyRC53DFrdEl4=";
      };
    };
  });
  meta = {
    description = "Demos using Gazebo Sim simulation with ROS.";
  };
})
