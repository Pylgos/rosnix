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
  version = "2.0.3-1";
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
        rev = "03651ae1b7a7efe0b9e09320e9741d49b0ab2848";
        hash = "sha256-TDck0z8teunR/pKkaB3T45lwVoVI1/0ZgBYH/u3Lcgw=";
      };
    };
  });
  meta = {
    description = "Control the Parrot JumpingSumo drone via ROS2 topics";
  };
})
