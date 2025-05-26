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
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."libcaer_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ camera-info-manager event-camera-msgs image-transport libcaer-vendor rclcpp rclcpp-components sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ camera-info-manager event-camera-msgs image-transport libcaer-vendor rclcpp rclcpp-components sensor-msgs std-srvs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "libcaer_driver" = substituteSource {
      src = fetchgit {
        name = "libcaer_driver-source";
        url = "https://github.com/ros2-gbp/libcaer_driver-release.git";
        rev = "c700334419504b8d7518c00f62470d5593a76afe";
        hash = "sha256-wdOgGh94YQOC7OGI1i3lvbCh6+JtkRFBrImNjPC53CY=";
      };
    };
  });
  meta = {
    description = "ROS2 driver for event base sensors using libcaer";
  };
})
