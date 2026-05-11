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
  pname = "depthai_bridge";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."depthai_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai depthai-ros-msgs ffmpeg-image-transport-msgs image-transport nav-msgs rclcpp robot-state-publisher ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-info-manager composition-interfaces cv-bridge depthai depthai-ros-msgs ffmpeg-image-transport-msgs image-transport nav-msgs rclcpp robot-state-publisher ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_bridge" = substituteSource {
      src = fetchgit {
        name = "depthai_bridge-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "326187fdf6304560d8aaa659e1a4a5075a5aada5";
        hash = "sha256-WE5F7b4D8zakCjhzC7+ntgGpjnpN1Dox2BaMdCLd/Mw=";
      };
    };
  });
  meta = {
    description = "The depthai_bridge package";
  };
})
