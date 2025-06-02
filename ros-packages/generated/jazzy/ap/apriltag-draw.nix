{
  ament-cmake,
  ament-cmake-clang-format,
  ament-lint-auto,
  ament-lint-common,
  apriltag-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_draw";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."apriltag_draw";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedNativeBuildInputs = [ apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "apriltag_draw" = substituteSource {
      src = fetchgit {
        name = "apriltag_draw-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "4808f74ad8aca99ee0eff70363d26cf96453a83b";
        hash = "sha256-IYKtty0B1iPiMTWiJjRx3p83hREn6djVlAil4F43ZGM=";
      };
    };
  });
  meta = {
    description = "ROS package for drawing apriltags on image";
  };
})
