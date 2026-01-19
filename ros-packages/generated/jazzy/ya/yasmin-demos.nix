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
        rev = "d8d43e0e647ff08300554aa7f3721d40667867de";
        hash = "sha256-yQFzXp1qtPof1gnsOUvYf0NmBOOZTkQInRRonhVu0Mw=";
      };
    };
  });
  meta = {
    description = "Demos of YASMIN (Yet Another State MachINe)";
  };
})
