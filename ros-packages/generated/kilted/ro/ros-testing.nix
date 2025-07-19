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
  version = "0.8.0-2";
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
        rev = "72ebb8a431cf805d27e953fb3c7bb6a22098db60";
        hash = "sha256-0tK9r5gFIoHHtxtDyu+FDsReDPyYIPTwUY2kycUpv3c=";
      };
    };
  });
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
})
