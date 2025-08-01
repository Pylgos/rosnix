{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthimage_to_laserscan";
  version = "2.5.1-3";
  src = finalAttrs.passthru.sources."depthimage_to_laserscan";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ image-geometry rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ image-geometry rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "depthimage_to_laserscan" = substituteSource {
      src = fetchgit {
        name = "depthimage_to_laserscan-source";
        url = "https://github.com/ros2-gbp/depthimage_to_laserscan-release.git";
        rev = "b19197dad70d679d5a4c1dee39c0ba47cbe7fafb";
        hash = "sha256-QU8tJNEPEB6X439eDP+kDXczR29OQNtKRX1uXKDqgDo=";
      };
    };
  });
  meta = {
    description = "depthimage_to_laserscan";
  };
})
