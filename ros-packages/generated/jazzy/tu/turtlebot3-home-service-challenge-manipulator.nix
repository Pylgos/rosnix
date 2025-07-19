{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-ros-planning-interface,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  turtlebot3-home-service-challenge-tools,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_home_service_challenge_manipulator";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot3_home_service_challenge_manipulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-ros-planning-interface rclcpp std-msgs turtlebot3-home-service-challenge-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-ros-planning-interface rclcpp std-msgs turtlebot3-home-service-challenge-tools ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_home_service_challenge_manipulator" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_home_service_challenge_manipulator-source";
        url = "https://github.com/ros2-gbp/turtlebot3_home_service_challenge-release.git";
        rev = "f68b70351045ed5df89a184f75bff9073c2b733b";
        hash = "sha256-qKmxaaV2RfaMUpr3zCFYnmCvdLE8HR1KV9i7o5OekzM=";
      };
    };
  });
  meta = {
    description = "\n    Manipulator controller package for turtlebot3_home_service_challenge\n  ";
  };
})
