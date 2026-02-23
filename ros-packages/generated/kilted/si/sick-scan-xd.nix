{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rcl-interfaces,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sick_scan_xd";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."sick_scan_xd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs nav-msgs rcl-interfaces rclcpp ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs nav-msgs rcl-interfaces rclcpp ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sick_scan_xd" = substituteSource {
      src = fetchgit {
        name = "sick_scan_xd-source";
        url = "https://github.com/ros2-gbp/sick_scan_xd-release.git";
        rev = "f62af7f09730ce412fb9967bf6cf5f6843b29e79";
        hash = "sha256-HBwU1bIBTaOr84Be8bKExOgM4l1p5AeD8X9lrn+paI8=";
      };
    };
  });
  meta = {
    description = "ROS 1 and 2 driver for SICK scanner";
  };
})
