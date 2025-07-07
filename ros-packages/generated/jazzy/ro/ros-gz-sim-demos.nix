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
  rviz2,
  sdformat-urdf,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim_demos";
  version = "1.0.16-1";
  src = finalAttrs.passthru.sources."ros_gz_sim_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-sim-vendor image-transport-plugins robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim rqt-image-view rqt-plot rqt-topic rviz2 sdformat-urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-sim-vendor image-transport-plugins robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim rqt-image-view rqt-plot rqt-topic rviz2 sdformat-urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim_demos" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim_demos-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "0741a4b669c80d9a0c55bcf87b3e53d23d921c68";
        hash = "sha256-ee2OiXt2qlZeF6yCZ+34zIH+HiOMR3Is42LjwPS4FNk=";
      };
    };
  });
  meta = {
    description = "Demos using Gazebo Sim simulation with ROS.";
  };
})
