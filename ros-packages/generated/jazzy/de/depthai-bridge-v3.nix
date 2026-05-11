{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  camera-info-manager,
  composition-interfaces,
  cv-bridge,
  depthai-ros-msgs-v3,
  depthai-v3,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-image-transport-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  robot-state-publisher,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  vision-msgs,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_bridge_v3";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."depthai_bridge_v3";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai-ros-msgs-v3 depthai-v3 ffmpeg-image-transport-msgs image-transport nav-msgs rclcpp robot-state-publisher ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai-ros-msgs-v3 depthai-v3 ffmpeg-image-transport-msgs image-transport nav-msgs rclcpp robot-state-publisher ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_bridge_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_bridge_v3-source";
        url = "https://github.com/luxonis/depthai-ros-v3-release.git";
        rev = "aa545209bef25fb9c15c4f06628d2948cad0167b";
        hash = "sha256-/kkEFSSv8XiSBh3nRxe18KDFxsAz0KXgnl9QEGZsojY=";
      };
    };
  });
  meta = {
    description = "The depthai_bridge_v3 package";
  };
})
