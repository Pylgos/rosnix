{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
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
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."tuw_geometry";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros gtest-vendor ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geometry" = substituteSource {
      src = fetchgit {
        name = "tuw_geometry-source";
        url = "https://github.com/ros2-gbp/tuw_geometry-release.git";
        rev = "8e1dce524806d0df82c44b338a4f37726cfa8ca2";
        hash = "sha256-fkSJlZy6o4aN2oGwkDderv50YYpggMaSuaczkuaJNRM=";
      };
    };
  });
  meta = {
    description = "The tuw_geometry package";
  };
})
