{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "launch_testing_ament_cmake";
  version = "3.4.10-1";
  src = finalAttrs.passthru.sources."launch_testing_ament_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test launch-testing python-cmake-module ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-test launch-testing python-cmake-module ];
  checkInputs = [ ament-cmake-copyright launch-testing python-cmake-module ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ament_cmake" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ament_cmake-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "b168464d671c5e68883eb565288a9e95c024fe9f";
        hash = "sha256-O9oF2hnUccDZTh/dmbKp/Y8TJYYh2UaNcB+PBiqgT44=";
      };
    };
  });
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
})
