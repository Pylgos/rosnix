{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  camera-info-manager,
  event-camera-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  libcaer-vendor,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libcaer_driver";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."libcaer_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ camera-info-manager event-camera-msgs image-transport libcaer-vendor rclcpp rclcpp-components sensor-msgs std-srvs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "libcaer_driver" = substituteSource {
      src = fetchgit {
        name = "libcaer_driver-source";
        url = "https://github.com/ros2-gbp/libcaer_driver-release.git";
        rev = "15bdd3ac212331f96682cbafe52456cac109056e";
        hash = "sha256-Ge0HgJZRYzUswYHpwhwYzM47hv9cz92j4wZsl39Ve2c=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for event base sensors using libcaer";
  };
})
