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
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  realsense2-camera-msgs,
  ros-environment,
  ros2topic,
  rosSystemPackages,
  sensor-msgs,
  sensor-msgs-py,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realsense2_camera";
  version = "4.56.4-1";
  src = finalAttrs.passthru.sources."realsense2_camera";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces cv-bridge diagnostic-updater geometry-msgs image-transport launch-ros librealsense2 lifecycle-msgs nav-msgs rclcpp rclcpp-components rclcpp-lifecycle realsense2-camera-msgs ros-environment sensor-msgs std-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge diagnostic-updater geometry-msgs image-transport launch-ros librealsense2 lifecycle-msgs nav-msgs rclcpp rclcpp-components rclcpp-lifecycle realsense2-camera-msgs ros-environment sensor-msgs std-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest launch-pytest launch-testing ros2topic sensor-msgs-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-requests" "python3-tqdm" ]; };
  passthru.sources = mkSourceSet (sources: {
    "realsense2_camera" = substituteSource {
      src = fetchgit {
        name = "realsense2_camera-source";
        url = "https://github.com/ros2-gbp/realsense-ros-release.git";
        rev = "9501540d56118211537fbfb3d31f9e6518fb180a";
        hash = "sha256-zHBSfIRLDdOLkT0dxdzlFN7B5Hmp8wys+2q3KCS8pro=";
      };
    };
  });
  meta = {
    description = "RealSense camera package allowing access to Intel D400 3D cameras";
  };
})
