{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-lint-auto,
  apriltag,
  apriltag-msgs,
  buildAmentCmakePackage,
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
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_ros";
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."apriltag_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ apriltag apriltag-msgs cv-bridge image-transport rclcpp rclcpp-components sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "apriltag_ros" = substituteSource {
        src = fetchgit {
          name = "apriltag_ros-source";
          url = "https://github.com/ros2-gbp/apriltag_ros-release.git";
          rev = "1f0ff6ec7df749994976a6c7df51b3bfdf954763";
          hash = "sha256-1BAPfaLgYZ+JV3LFidzL5IOnM4wd7fvcXNRkAzCyZU4=";
        };
      };
    });
  };
  meta = {
    description = "AprilTag detection node";
  };
})
