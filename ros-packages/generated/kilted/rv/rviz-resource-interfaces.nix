{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_resource_interfaces";
  version = "15.0.4-1";
  src = finalAttrs.passthru.sources."rviz_resource_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_resource_interfaces" = substituteSource {
      src = fetchgit {
        name = "rviz_resource_interfaces-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "be77c6bf2015d5ad385950abd05b0409817c3aa7";
        hash = "sha256-0bpUBwe+AY+eifmWzdcz3OLpqf9HJmIRjQNu/QKgHFc=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for working with resources like meshes.";
  };
})
