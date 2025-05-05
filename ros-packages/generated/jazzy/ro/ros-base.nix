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
  version = "0.11.0-1";
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
        rev = "5e0023e0e7580c315c038b95ad50501de894a7d2";
        hash = "sha256-qDeMCM1VeU74XfEYB3E5caLxe/rMeyfJaQYQTyUmR98=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_core' and includes other basic functionalities like tf2 and urdf.";
  };
})
