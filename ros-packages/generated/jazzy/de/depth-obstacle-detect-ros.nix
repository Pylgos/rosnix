{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  depth-obstacle-detect-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depth_obstacle_detect_ros";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."depth_obstacle_detect_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge depth-obstacle-detect-ros-msgs image-transport rclcpp rclcpp-components rclpy ros2launch sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge depth-obstacle-detect-ros-msgs image-transport rclcpp rclcpp-components rclpy ros2launch sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depth_obstacle_detect_ros" = substituteSource {
      src = fetchgit {
        name = "depth_obstacle_detect_ros-source";
        url = "https://github.com/ros2-gbp/depth_obstacle_detect_ros-release.git";
        rev = "8c6f3ad126e9c2417eef9d4d8f951e2299727225";
        hash = "sha256-Pji96xaGWJgeIRmtjAeq51CgJUM7MsRZk7WDlBH66JY=";
      };
    };
  });
  meta = {
    description = "The depth based obstacle detection package";
  };
})
