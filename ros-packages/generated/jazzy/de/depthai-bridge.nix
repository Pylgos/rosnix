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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."depthai_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai depthai-ros-msgs ffmpeg-image-transport-msgs image-transport rclcpp robot-state-publisher sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_bridge" = substituteSource {
      src = fetchgit {
        name = "depthai_bridge-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "e85a265f119ae1e5001efa499f2b3a09a2a21167";
        hash = "sha256-3mRC34ql1pNwXIxpocExZnci/KfQAhg3EWW6OYdyfZo=";
      };
    };
  });
  meta = {
    description = "The depthai_bridge package";
  };
})
