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
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."ardrone_sumo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ardrone-sdk cv-bridge rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ardrone-sdk cv-bridge rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ardrone_sumo" = substituteSource {
      src = fetchgit {
        name = "ardrone_sumo-source";
        url = "https://github.com/ros2-gbp/ardrone_ros-release.git";
        rev = "5929e94c455cd8250fe4d974747255a06321cfbf";
        hash = "sha256-EXISsAQjuidqLkktdVPNJ2npSjvHc51+gAkntuUkaUI=";
      };
    };
  });
  meta = {
    description = "Control the Parrot JumpingSumo drone via ROS2 topics";
  };
})
