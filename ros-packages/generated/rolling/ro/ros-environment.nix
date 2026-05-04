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
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."ros_environment";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ros_environment" = substituteSource {
      src = fetchgit {
        name = "ros_environment-source";
        url = "https://github.com/ros2-gbp/ros_environment-release.git";
        rev = "6cbc74c63f5ba5a24f615a1f54e9ed2235e4d1d4";
        hash = "sha256-gZGL5qp1Phu8wbvFtcDiiNk59hlL47AzXxufV9kWGEc=";
      };
    };
  });
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
})
