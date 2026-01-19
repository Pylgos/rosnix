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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."metavision_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ event-camera-msgs openeb-vendor rclcpp rclcpp-components std-srvs ];
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ event-camera-msgs openeb-vendor rclcpp rclcpp-components std-srvs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "metavision_driver" = substituteSource {
      src = fetchgit {
        name = "metavision_driver-source";
        url = "https://github.com/ros2-gbp/metavision_driver-release.git";
        rev = "0faf5a4fa37d8559814a178ffd5b832d75dd38ed";
        hash = "sha256-yWnX3o7Eh1//HPSS9fITythCk+iM3t6jDobLrGsixRk=";
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
