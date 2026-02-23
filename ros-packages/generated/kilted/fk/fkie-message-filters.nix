{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fkie_message_filters";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."fkie_message_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ image-transport rclcpp sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport rclcpp sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-ros rclcpp-lifecycle std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "fkie_message_filters" = substituteSource {
      src = fetchgit {
        name = "fkie_message_filters-source";
        url = "https://github.com/ros2-gbp/fkie_message_filters-release.git";
        rev = "236ce701c2e18abfb7689d40359f967ca582d97f";
        hash = "sha256-+LjpS9vepag5Q/RdIxY7cTc+XMfIB97ZzKPmoWQx+vc=";
      };
    };
  });
  meta = {
    description = "Improved ROS message filters";
  };
})
