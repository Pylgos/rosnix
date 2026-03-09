{
  ament-cmake-auto,
  ament-cmake-gtest,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_fmt_logger";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."ros2_fmt_logger";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ backward-ros rclcpp rcutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ backward-ros rclcpp rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_fmt_logger" = substituteSource {
      src = fetchgit {
        name = "ros2_fmt_logger-source";
        url = "https://github.com/ros2-gbp/ros2_fmt_logger-release.git";
        rev = "6ff0834d428f0a998d727b13b518663579aeaaf8";
        hash = "sha256-yedXEwcf7RwKRqYVsbjXoQiwn5U4T6ZS2jluGckQ1dk=";
      };
    };
  });
  meta = {
    description = "\n    A modern, ROS 2 logging library that provides fmt-style formatting as a replacement for RCLCPP logging macros\n  ";
  };
})
