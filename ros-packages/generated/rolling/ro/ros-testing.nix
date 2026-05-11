{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-export-dependencies,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  ros2test,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_testing";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."ros_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies launch-testing launch-testing-ament-cmake launch-testing-ros ros2test ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies launch-testing launch-testing-ament-cmake launch-testing-ros ros2test ];
  passthru.sources = mkSourceSet (sources: {
    "ros_testing" = substituteSource {
      src = fetchgit {
        name = "ros_testing-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "a5c6c2f823075b171c9e051525f8d1653567149e";
        hash = "sha256-Hn9A6aLyQnpAHYigfItB4QXRk/JypxRG8jcMiqLB07s=";
      };
    };
  });
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
})
