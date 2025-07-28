{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  realsense2-camera-msgs,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realsense2_description";
  version = "4.56.4-2";
  src = finalAttrs.passthru.sources."realsense2_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-ros rclcpp rclcpp-components realsense2-camera-msgs xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros rclcpp rclcpp-components realsense2-camera-msgs xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "realsense2_description" = substituteSource {
      src = fetchgit {
        name = "realsense2_description-source";
        url = "https://github.com/ros2-gbp/realsense-ros-release.git";
        rev = "5d26fda5594961d1af5e98a8274decf35d27b709";
        hash = "sha256-fz3gcbbQfuQi1rz5liyQ1Wz1kBknqCcHSm/U5wgPhoo=";
      };
    };
  });
  meta = {
    description = "RealSense description package for Intel 3D D400 cameras";
  };
})
