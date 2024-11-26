{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_environment";
  version = "4.2.1-1";
  src = finalAttrs.passthru.sources."ros_environment";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros_environment" = substituteSource {
        src = fetchgit {
          name = "ros_environment-source";
          url = "https://github.com/ros2-gbp/ros_environment-release.git";
          rev = "cfb36f6e53a770b4b31a053b82dfc0dec648b685";
          hash = "sha256-dwFnwm7ilNij7JeJ7sBPii3MX2KZVS3uvMBD8MJpIag=";
        };
      };
    });
  };
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
})
