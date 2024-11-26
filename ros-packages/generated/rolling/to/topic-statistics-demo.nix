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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."topic_statistics_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rcutils sensor-msgs statistics-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "topic_statistics_demo" = substituteSource {
      src = fetchgit {
        name = "topic_statistics_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "1e1c2e303fba03c38a0daab6001fbe8933acee3c";
        hash = "sha256-tD8tkWtbV/hIM0QymhqaIvWy4+qIVuEnZVitBMNp85w=";
      };
    };
  });
  meta = {
    description = "C++ demo application for topic statistics feature.";
  };
})
