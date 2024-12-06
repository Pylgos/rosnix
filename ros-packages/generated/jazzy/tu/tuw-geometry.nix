{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_geometry";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."tuw_geometry";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geometry" = substituteSource {
      src = fetchgit {
        name = "tuw_geometry-source";
        url = "https://github.com/ros2-gbp/tuw_geometry-release.git";
        rev = "2d261df9f998e4df014fc868678980393f0278e9";
        hash = "sha256-k0dhAhNxWBW5ANml+dUI6KeVGFk3SHjiBe4k+VoBvd0=";
      };
    };
  });
  meta = {
    description = "The tuw_geometry package";
  };
})
