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
  version = "0.8.0-1";
  src = finalAttrs.passthru.sources."ros_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies launch-testing-ament-cmake ];
  propagatedBuildInputs = [ launch-testing launch-testing-ros ros2test ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros_testing" = substituteSource {
        src = fetchgit {
          name = "ros_testing-source";
          url = "https://github.com/ros2-gbp/ros_testing-release.git";
          rev = "05e86164252e57a0cf75996fcab8d100e086fcfc";
          hash = "sha256-0tK9r5gFIoHHtxtDyu+FDsReDPyYIPTwUY2kycUpv3c=";
        };
      };
    });
  };
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
})
