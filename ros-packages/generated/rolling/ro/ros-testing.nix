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
  version = "0.9.1-2";
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
        rev = "48236b2258f05695981169dbccfd0de9989ddd8e";
        hash = "sha256-AtOPHTKTNA0IetJiYFCHXUbrDq4WNrOxP0CntVVt5Kk=";
      };
    };
  });
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
})
