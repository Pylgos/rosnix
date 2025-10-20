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
  version = "1.0.0-1";
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
        rev = "5d9da75ae8c1413e03be09ca9484d47e0a21efc2";
        hash = "sha256-CACY99vPf0op14xxFtByQu7TLjKUDhmfxMHhmJKDL1c=";
      };
    };
  });
  meta = {
    description = "\n    A modern, ROS 2 logging library that provides fmt-style formatting as a replacement for RCLCPP logging macros\n  ";
  };
})
