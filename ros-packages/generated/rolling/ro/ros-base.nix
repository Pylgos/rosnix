{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry2,
  kdl-parser,
  mkSourceSet,
  robot-state-publisher,
  ros-core,
  rosSystemPackages,
  rosbag2,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_base";
  version = "0.13.0-2";
  src = finalAttrs.passthru.sources."ros_base";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry2 kdl-parser robot-state-publisher ros-core rosbag2 urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry2 kdl-parser robot-state-publisher ros-core rosbag2 urdf ];
  passthru.sources = mkSourceSet (sources: {
    "ros_base" = substituteSource {
      src = fetchgit {
        name = "ros_base-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "b03ad2a8d08e8fe7f162b502d2cbb7a87ce54f09";
        hash = "sha256-XFA3IsalGLKaZrMIM5Jf4DKJ2H/YUV/4l9Wn1GJMK3g=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_core' and includes other basic functionalities like tf2 and urdf.";
  };
})
