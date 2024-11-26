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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."libcaer_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ camera-info-manager event-camera-msgs image-transport libcaer-vendor rclcpp rclcpp-components sensor-msgs std-srvs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "libcaer_driver" = substituteSource {
        src = fetchgit {
          name = "libcaer_driver-source";
          url = "https://github.com/ros2-gbp/libcaer_driver-release.git";
          rev = "98c5d05aae3f8ae95769dfb0b4342036a1f7c7e3";
          hash = "sha256-2CCXUtNReP9e8B8KI4rXba1zz2y08JMikrKRtzV0+fI=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 driver for event base sensors using libcaer";
  };
})
