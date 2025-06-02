{
  ament-cmake-core,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_generator_type_description";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_type_description";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidlcpp-generator-core rosidlcpp-parser ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core rosidlcpp-generator-core rosidlcpp-parser ];
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_type_description" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_type_description-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "c7c3e7765cb8374e8ae3f5769a87ee58eb42223a";
        hash = "sha256-SfM/5aqmoxQzx6pnHfYWKPksbsMVt4W2Nqpxw/A/qKc=";
      };
    };
  });
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
})
