{
  ament-cmake,
  ament-cmake-gtest,
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
  version = "3.0.7-1";
  src = finalAttrs.passthru.sources."depthai_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai depthai-ros-msgs ffmpeg-image-transport-msgs image-transport rclcpp robot-state-publisher ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai depthai-ros-msgs ffmpeg-image-transport-msgs image-transport rclcpp robot-state-publisher ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_bridge" = substituteSource {
      src = fetchgit {
        name = "depthai_bridge-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "a25acc60308597c84b2b0b0ed33ef821243929c6";
        hash = "sha256-I+W5BWnQUxJFx1JU8fQrNgalHEamqseAPNNZzeHagLY=";
      };
    };
  });
  meta = {
    description = "The depthai_bridge package";
  };
})
