{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  builtin-interfaces,
  cv-bridge,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  launch-pytest,
  launch-ros,
  launch-testing,
  librealsense2,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  realsense2-camera-msgs,
  ros-environment,
  ros2topic,
  rosSystemPackages,
  sensor-msgs,
  sensor-msgs-py,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realsense2_camera";
  version = "4.55.1-3";
  src = finalAttrs.passthru.sources."realsense2_camera";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge diagnostic-updater geometry-msgs image-transport launch-ros librealsense2 nav-msgs rclcpp rclcpp-components realsense2-camera-msgs sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest launch-pytest launch-testing ros2topic sensor-msgs-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-requests" "python3-tqdm" ]; };
  passthru.sources = mkSourceSet (sources: {
    "realsense2_camera" = substituteSource {
      src = fetchgit {
        name = "realsense2_camera-source";
        url = "https://github.com/IntelRealSense/realsense-ros-release.git";
        rev = "7acfab07cc185dbc1feb9a98c38c77a81d45f558";
        hash = "sha256-HLMJvHtjNkhBqaTH95BraW0/xbrTUIcDdAE/18aDBWw=";
      };
    };
  });
  meta = {
    description = "RealSense camera package allowing access to Intel D400 3D cameras";
  };
})
