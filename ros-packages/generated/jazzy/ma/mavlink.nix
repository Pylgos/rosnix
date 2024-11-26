{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mavlink";
  version = "2024.10.10-1";
  src = finalAttrs.passthru.sources."mavlink";
  nativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-future" "python3-lxml" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "mavlink" = substituteSource {
        src = fetchgit {
          name = "mavlink-source";
          url = "https://github.com/ros2-gbp/mavlink-gbp-release.git";
          rev = "58eecbc20e706c784f0758982182da5fcf4abf78";
          hash = "sha256-jllCwbTFO+CDKFnFreK49tfu3P3j+Xbgrm6a90V3M1g=";
        };
      };
    });
  };
  meta = {
    description = "MAVLink message marshaling library. This package provides C-headers and C++11 library for both 1.0 and 2.0 versions of protocol. For pymavlink use separate install via rosdep (python-pymavlink).";
  };
})
