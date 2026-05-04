{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  statistics-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_statistics_demo";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."topic_statistics_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rcutils sensor-msgs statistics-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rcutils sensor-msgs statistics-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "topic_statistics_demo" = substituteSource {
      src = fetchgit {
        name = "topic_statistics_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "136782f39c5ec0bd6d974e40f9e62925dfdde1f9";
        hash = "sha256-cTMQD4SNokFGUv723SJINS0mr6a/d7pavwA6xgMn39I=";
      };
    };
  });
  meta = {
    description = "C++ demo application for topic statistics feature.";
  };
})
