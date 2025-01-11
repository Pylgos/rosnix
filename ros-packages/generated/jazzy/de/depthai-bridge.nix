{
  ament-cmake,
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
  version = "2.10.5-1";
  src = finalAttrs.passthru.sources."depthai_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai depthai-ros-msgs ffmpeg-image-transport-msgs image-transport rclcpp robot-state-publisher sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_bridge" = substituteSource {
      src = fetchgit {
        name = "depthai_bridge-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "56f95fea68e9afc81a213fb5472018158aa77a0d";
        hash = "sha256-ZZzm3+2gOEBfwFNdLCTNqA/maGhcAA/I3HIl189t3K0=";
      };
    };
  });
  meta = {
    description = "The depthai_bridge package";
  };
})
