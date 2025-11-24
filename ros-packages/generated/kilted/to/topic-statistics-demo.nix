{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  version = "0.36.3-1";
  src = finalAttrs.passthru.sources."topic_statistics_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rcutils sensor-msgs statistics-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rcutils sensor-msgs statistics-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "topic_statistics_demo" = substituteSource {
      src = fetchgit {
        name = "topic_statistics_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "aa8fcfce2db70d21a52f44d34ab351aee32746a5";
        hash = "sha256-JhnNkMB9Bzu387xZuDQoJ7b0zNITCYNq45axMA6nP6c=";
      };
    };
  });
  meta = {
    description = "C++ demo application for topic statistics feature.";
  };
})
