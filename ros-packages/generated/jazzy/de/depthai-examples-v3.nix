{
  ament-cmake,
  backward-ros,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  depth-image-proc,
  depthai-bridge-v3,
  depthai-descriptions-v3,
  depthai-ros-msgs-v3,
  depthai-v3,
  fetchgit,
  fetchurl,
  fetchzip,
  foxglove-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
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
  pname = "depthai_examples_v3";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."depthai_examples_v3";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ backward-ros camera-info-manager cv-bridge depth-image-proc depthai-bridge-v3 depthai-descriptions-v3 depthai-ros-msgs-v3 depthai-v3 foxglove-msgs image-transport nav-msgs rclcpp robot-state-publisher ros-environment rviz-imu-plugin sensor-msgs std-msgs stereo-msgs vision-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros camera-info-manager cv-bridge depth-image-proc depthai-bridge-v3 depthai-descriptions-v3 depthai-ros-msgs-v3 depthai-v3 foxglove-msgs image-transport nav-msgs rclcpp robot-state-publisher ros-environment rviz-imu-plugin sensor-msgs std-msgs stereo-msgs vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_examples_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_examples_v3-source";
        url = "https://github.com/luxonis/depthai-ros-v3-release.git";
        rev = "eb5de0043a01fbb21a3a451fad611489e8a7fcac";
        hash = "sha256-NUs6qxsCdVMpLyPm+CrP9AfvgEPVtcLIaXTlmivH6PY=";
      };
    };
  });
  meta = {
    description = "The depthai_examples_v3 package";
  };
})
