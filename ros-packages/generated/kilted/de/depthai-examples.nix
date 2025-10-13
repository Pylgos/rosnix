{
  ament-cmake,
  backward-ros,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  depth-image-proc,
  depthai,
  depthai-bridge,
  depthai-descriptions,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  foxglove-msgs,
  image-transport,
  mkSourceSet,
  rclcpp,
  robot-state-publisher,
  ros-environment,
  rosSystemPackages,
  rviz-imu-plugin,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  vision-msgs,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_examples";
  version = "3.0.7-1";
  src = finalAttrs.passthru.sources."depthai_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ backward-ros camera-info-manager cv-bridge depth-image-proc depthai depthai-bridge depthai-descriptions depthai-ros-msgs foxglove-msgs image-transport rclcpp robot-state-publisher ros-environment rviz-imu-plugin sensor-msgs std-msgs stereo-msgs vision-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros camera-info-manager cv-bridge depth-image-proc depthai depthai-bridge depthai-descriptions depthai-ros-msgs foxglove-msgs image-transport rclcpp robot-state-publisher ros-environment rviz-imu-plugin sensor-msgs std-msgs stereo-msgs vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_examples" = substituteSource {
      src = fetchgit {
        name = "depthai_examples-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "72458ec08ab07678da9e9946e0a6421d64b7420a";
        hash = "sha256-KgwBloxuwKfctRqDIuwOt3FqkbkFqShLlUzJaPmnnyA=";
      };
    };
  });
  meta = {
    description = "The depthai_examples package";
  };
})
