{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-mypy,
  ament-cmake-pep257,
  ament-cmake-pyflakes,
  ament-cmake-xmllint,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-view,
  libcamera,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "camera_ros";
  version = "0.4.0-2";
  src = finalAttrs.passthru.sources."camera_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python camera-info-manager cv-bridge image-view libcamera rclcpp rclcpp-components ros2launch sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python camera-info-manager cv-bridge image-view libcamera rclcpp rclcpp-components ros2launch sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-mypy ament-cmake-pep257 ament-cmake-pyflakes ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-format" ]; };
  passthru.sources = mkSourceSet (sources: {
    "camera_ros" = substituteSource {
      src = fetchgit {
        name = "camera_ros-source";
        url = "https://github.com/ros2-gbp/camera_ros-release.git";
        rev = "1f55fb0a031464a697ba4afa9ab12e634ba08997";
        hash = "sha256-UH1dMkgWDu+5N0JKZ+4o4YHv3R2YWfbVqd7DcYFWJZU=";
      };
    };
  });
  meta = {
    description = "node for libcamera supported cameras (V4L2, Raspberry Pi Camera Modules)";
  };
})
