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
  version = "4.3.0-1";
  src = finalAttrs.passthru.sources."ros_environment";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ros_environment" = substituteSource {
      src = fetchgit {
        name = "ros_environment-source";
        url = "https://github.com/ros2-gbp/ros_environment-release.git";
        rev = "b475ce549478c96fc257d4e6972ff1dc826cc33b";
        hash = "sha256-89KnNs/zSjc8CUp8tpoXh/YqEY+4zvPZAC5plw7aGCg=";
      };
    };
  });
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
})
