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
  version = "0.38.0-1";
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
        rev = "681e422e34ae32eecf6181a3105c7a1e9d6f8cfd";
        hash = "sha256-0p1jwJy1IzfvI+DcvlJWYTJyGNWOJIUVnNGhUvDBQxk=";
      };
    };
  });
  meta = {
    description = "C++ demo application for topic statistics feature.";
  };
})
