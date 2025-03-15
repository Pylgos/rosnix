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
  event-camera-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  openeb-vendor,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "metavision_driver";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."metavision_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ event-camera-msgs openeb-vendor rclcpp rclcpp-components std-srvs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "metavision_driver" = substituteSource {
      src = fetchgit {
        name = "metavision_driver-source";
        url = "https://github.com/ros2-gbp/metavision_driver-release.git";
        rev = "dcae33304100290d14ad6e4c76b8adbbf0a3c1bd";
        hash = "sha256-9W9HzmENn/28iEl6Tl0iIVc6KG5e/14mXS7SxXxcCnQ=";
      };
      substitutions = [
        {
          path = "cmake/ROS1.cmake";
          from = "GIT_REPOSITORY https://github.com/ros-event-camera/openeb.git";
          to = "URL ${sources."metavision_driver/openeb"}";
        }
      ];
    };
    "metavision_driver/openeb" = substituteSource {
      src = fetchgit {
        name = "openeb-source";
        url = "https://github.com/ros-event-camera/openeb.git";
        rev = "db34531b9d0fef952e39f5fef7169e583575b6e9";
        hash = "sha256-QHs3Bz6Mj08Rk8lUAIyWfMwMcoW1XCswASYhX0hfPiM=";
      };
    };
  });
  meta = {
    description = "ROS1 and ROS2 drivers for metavision based event cameras";
  };
})
