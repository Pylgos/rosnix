{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-industrial-cmake-boilerplate,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "stomp";
  version = "0.1.2-4";
  src = finalAttrs.passthru.sources."stomp";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-industrial-cmake-boilerplate ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libconsole-bridge-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ros-industrial-cmake-boilerplate ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libconsole-bridge-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "stomp" = substituteSource {
      src = fetchgit {
        name = "stomp-source";
        url = "https://github.com/ros2-gbp/stomp-release.git";
        rev = "699543c259979d6b331206a37941d78cd3122b0e";
        hash = "sha256-SMIxIQFBhVkKNSvnxdsAWw5pg4rc6p5xSsSck1Ig4Y8=";
      };
    };
  });
  meta = {
    description = "This package  provides the STOMP (Stochastic Trajectory Optimization for Motion Planning) algorithm that can be used for robot motion planning tasks or other similar optimization tasks";
  };
})
