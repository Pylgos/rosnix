{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclpy,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-factory,
  yasmin-ros,
  yasmin-viewer,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_demos";
  version = "4.2.3-1";
  src = finalAttrs.passthru.sources."yasmin_demos";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ example-interfaces nav-msgs pluginlib rclcpp rclcpp-action rclpy ros-environment yasmin yasmin-factory yasmin-ros yasmin-viewer ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ example-interfaces nav-msgs pluginlib rclcpp rclcpp-action rclpy ros-environment yasmin yasmin-factory yasmin-ros yasmin-viewer ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_demos" = substituteSource {
      src = fetchgit {
        name = "yasmin_demos-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "21cbdca9c3038dbbba2fd2a0a05fc28cfeba6395";
        hash = "sha256-yQFzXp1qtPof1gnsOUvYf0NmBOOZTkQInRRonhVu0Mw=";
      };
    };
  });
  meta = {
    description = "Demos of YASMIN (Yet Another State MachINe)";
  };
})
