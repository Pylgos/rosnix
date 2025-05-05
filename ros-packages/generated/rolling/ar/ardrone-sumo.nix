{
  ament-cmake,
  ardrone-sdk,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ardrone_sumo";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."ardrone_sumo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ ardrone-sdk cv-bridge sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ardrone_sumo" = substituteSource {
      src = fetchgit {
        name = "ardrone_sumo-source";
        url = "https://github.com/ros2-gbp/ardrone_ros-release.git";
        rev = "ef64ce0ea91fb0984e46ec839fe0996e4a77a8ba";
        hash = "sha256-ilmzfXr/+iLfNmNiQ01ybZVguDLyCKBDgZQSIiIgk58=";
      };
    };
  });
  meta = {
    description = "Control the Parrot JumpingSumo drone via ROS2 topics";
  };
})
