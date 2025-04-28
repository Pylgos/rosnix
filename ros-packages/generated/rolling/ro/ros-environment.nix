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
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."ros_environment";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ros_environment" = substituteSource {
      src = fetchgit {
        name = "ros_environment-source";
        url = "https://github.com/ros2-gbp/ros_environment-release.git";
        rev = "25b0984c19675455cd3214fa4584c495c1751750";
        hash = "sha256-YdMytjZgzS8YTMkVwVaCnTH0Ua9VbKQdiuipG7fq3JM=";
      };
    };
  });
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
})
