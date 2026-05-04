{
  ament-cmake,
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
  version = "4.57.7-2";
  src = finalAttrs.passthru.sources."realsense2_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch-ros rclcpp rclcpp-components realsense2-camera-msgs xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-ros rclcpp rclcpp-components realsense2-camera-msgs xacro ];
  passthru.sources = mkSourceSet (sources: {
    "realsense2_description" = substituteSource {
      src = fetchgit {
        name = "realsense2_description-source";
        url = "https://github.com/ros2-gbp/realsense-ros-release.git";
        rev = "7cfb133379bb78745a3668341d045492ecd4474b";
        hash = "sha256-qlv/4yz0JR6Tg/H9WHP+4yEs9oAmwIF8sRWqHjQKyDM=";
      };
    };
  });
  meta = {
    description = "RealSense description package for RealSense 3D D400 cameras";
  };
})
