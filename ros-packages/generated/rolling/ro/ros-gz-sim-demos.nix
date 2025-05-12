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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."ros_gz_sim_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-sim-vendor image-transport-plugins robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim rqt-image-view rqt-plot rqt-topic rviz2 rviz-imu-plugin sdformat-urdf tf2-ros xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-sim-vendor image-transport-plugins robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim rqt-image-view rqt-plot rqt-topic rviz2 rviz-imu-plugin sdformat-urdf tf2-ros xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim_demos" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim_demos-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "648e156373bfc2b4758d210d6d7095b380847ffa";
        hash = "sha256-HwrAZZASRtv4wPUt4E9S+a8xzB6pJdhalv/ArZukIa0=";
      };
    };
  });
  meta = {
    description = "Demos using Gazebo Sim simulation with ROS.";
  };
})
