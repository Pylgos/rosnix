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
  version = "4.4.1-1";
  src = finalAttrs.passthru.sources."ros_environment";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ros_environment" = substituteSource {
      src = fetchgit {
        name = "ros_environment-source";
        url = "https://github.com/ros2-gbp/ros_environment-release.git";
        rev = "60097074dfc09f295cbc7929e1288b26cb1dfb6d";
        hash = "sha256-/YGesEix790JcZiNJcUCL3o6/hof3VmcJpjrip+4G/I=";
      };
    };
  });
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
})
