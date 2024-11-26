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
  version = "0.7.1-1";
  src = finalAttrs.passthru.sources."v4l2_camera";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "v4l2_camera" = substituteSource {
      src = fetchgit {
        name = "v4l2_camera-source";
        url = "https://github.com/ros2-gbp/ros2_v4l2_camera-release.git";
        rev = "ad3d1855e15fb303b725cb6522470ac178b88cb7";
        hash = "sha256-OaSGrGK1Lj3ZocwVMqc8WO1+T6jU/Ky2u2UwIpRHqwY=";
      };
    };
  });
  meta = {
    description = "A ROS 2 camera driver using Video4Linux2";
  };
})
