{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "v4l2_camera";
  version = "0.8.0-1";
  src = finalAttrs.passthru.sources."v4l2_camera";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ camera-info-manager cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "v4l2_camera" = substituteSource {
      src = fetchgit {
        name = "v4l2_camera-source";
        url = "https://github.com/ros2-gbp/ros2_v4l2_camera-release.git";
        rev = "8a225657a751c322296e70bf06f9ec219a8512e3";
        hash = "sha256-S7cVCHqNlQWviD0kxowVHhQ1Df2i6Ni0u1PqvH7uZ20=";
      };
    };
  });
  meta = {
    description = "A ROS 2 camera driver using Video4Linux2";
  };
})
