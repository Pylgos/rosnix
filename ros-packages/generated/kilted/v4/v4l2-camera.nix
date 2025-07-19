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
  version = "0.7.1-2";
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
        rev = "4ced102fe3863853905f9d58c47a56f6daab4b34";
        hash = "sha256-OaSGrGK1Lj3ZocwVMqc8WO1+T6jU/Ky2u2UwIpRHqwY=";
      };
    };
  });
  meta = {
    description = "A ROS 2 camera driver using Video4Linux2";
  };
})
