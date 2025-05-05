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
  version = "0.13.0-1";
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
        rev = "597a2b2da9b4b9a8e4de0bb7f55d3ab89222aae7";
        hash = "sha256-XFA3IsalGLKaZrMIM5Jf4DKJ2H/YUV/4l9Wn1GJMK3g=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_core' and includes other basic functionalities like tf2 and urdf.";
  };
})
