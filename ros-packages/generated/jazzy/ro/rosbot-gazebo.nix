{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gz-ros2-control,
  laser-filters,
  launch,
  launch-pytest,
  launch-ros,
  mkSourceSet,
  nav-msgs,
  rclpy,
  ros-gz-bridge,
  ros-gz-sim,
  rosSystemPackages,
  rosbot-controller,
  rosbot-joy,
  rosbot-localization,
  rosbot-utils,
  rviz2,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_gazebo";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-ros2-control laser-filters launch launch-ros ros-gz-bridge ros-gz-sim rosbot-controller rosbot-joy rosbot-localization rosbot-utils rviz2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "husarion_gz_worlds" "tf_namespace_bridge" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-ros2-control laser-filters launch launch-ros ros-gz-bridge ros-gz-sim rosbot-controller rosbot-joy rosbot-localization rosbot-utils rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "husarion_gz_worlds" "tf_namespace_bridge" ]; };
  checkInputs = [ ament-cmake-pytest geometry-msgs launch launch-pytest launch-ros nav-msgs rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_gazebo" = substituteSource {
      src = fetchgit {
        name = "rosbot_gazebo-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "c1b01f97e221909dffcc95496dfaa43fef95876a";
        hash = "sha256-2Iox+MYqmjqQaOLgbnugYdFiwkWLWTko7pSGpHU0RLM=";
      };
    };
  });
  meta = {
    description = "Gazebo simulation for ROSbot Series";
  };
})
