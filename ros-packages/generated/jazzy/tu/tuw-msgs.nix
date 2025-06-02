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
  substituteSource,
  tuw-airskin-msgs,
  tuw-geometry-msgs,
  tuw-graph-msgs,
  tuw-multi-robot-msgs,
  tuw-nav-msgs,
  tuw-object-map-msgs,
  tuw-object-msgs,
  tuw-std-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components tuw-airskin-msgs tuw-geometry-msgs tuw-graph-msgs tuw-multi-robot-msgs tuw-nav-msgs tuw-object-map-msgs tuw-object-msgs tuw-std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components tuw-airskin-msgs tuw-geometry-msgs tuw-graph-msgs tuw-multi-robot-msgs tuw-nav-msgs tuw-object-map-msgs tuw-object-msgs tuw-std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "b3ed8413a368fd7a1c3ad4aacf8ea0c5da0427bf";
        hash = "sha256-w01u6K5+7vngROfLPfWxYYDFTneIusoTcVs2RpxoUJE=";
      };
    };
  });
  meta = {
    description = "tuw_msgs meta package with write and read file libs for tuw_msgs";
  };
})
