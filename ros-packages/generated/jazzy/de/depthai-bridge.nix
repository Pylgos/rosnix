{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  camera-info-manager,
  composition-interfaces,
  cv-bridge,
  depthai,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-image-transport-msgs,
  image-transport,
  mkSourceSet,
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
  pname = "depthai_bridge";
  version = "2.10.3-1";
  src = finalAttrs.passthru.sources."depthai_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ ament-index-cpp camera-info-manager composition-interfaces cv-bridge depthai depthai-ros-msgs ffmpeg-image-transport-msgs image-transport rclcpp robot-state-publisher sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "depthai_bridge" = substituteSource {
        src = fetchgit {
          name = "depthai_bridge-source";
          url = "https://github.com/luxonis/depthai-ros-release.git";
          rev = "dc6ab0704c58d11783fd71886cab7d1d3a0412c1";
          hash = "sha256-g98wrCskPHjzIS1DPEcLUmG35MNTs7q5b0lEVepBiTU=";
        };
      };
    });
  };
  meta = {
    description = "The depthai_bridge package";
  };
})
