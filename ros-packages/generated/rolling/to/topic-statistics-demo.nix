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
  version = "0.37.0-1";
  src = finalAttrs.passthru.sources."topic_statistics_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rcutils sensor-msgs statistics-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "topic_statistics_demo" = substituteSource {
      src = fetchgit {
        name = "topic_statistics_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "042c54ce1a465b368aca4f50d9728c2f951ea9aa";
        hash = "sha256-K0Ez4AoyF2Gx4xsVmfuL1hs+0aYjeODuvZuzeV6NbW8=";
      };
    };
  });
  meta = {
    description = "C++ demo application for topic statistics feature.";
  };
})
