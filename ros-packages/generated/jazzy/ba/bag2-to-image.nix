{
  ament-cmake,
  ament-cmake-clang-format,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bag2_to_image";
  version = "0.1.0-5";
  src = finalAttrs.passthru.sources."bag2_to_image";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rosbag2-cpp rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "bag2_to_image" = substituteSource {
        src = fetchgit {
          name = "bag2_to_image-source";
          url = "https://github.com/ros2-gbp/bag2_to_image-release.git";
          rev = "3297bdaf4e1c18b523774df23c0da5d666acca50";
          hash = "sha256-D602KBwsYPh+wbNrK2y25DZk1/wPPc2PlZj4ktvPhqI=";
        };
      };
    });
  };
  meta = {
    description = "The bag2_to_image package";
  };
})
