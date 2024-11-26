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
  version = "0.6.0-3";
  src = finalAttrs.passthru.sources."ros_testing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies launch-testing-ament-cmake ];
  propagatedBuildInputs = [ launch-testing launch-testing-ros ros2test ];
  passthru.sources = mkSourceSet (sources: {
    "ros_testing" = substituteSource {
      src = fetchgit {
        name = "ros_testing-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "698ef5baf793b32a4d4e3ffcce820c13902e4ef1";
        hash = "sha256-fs+oXGxdtoXxQxvZSsImWJtNFp+X3jdTHN31wD+47Yg=";
      };
    };
  });
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
})
