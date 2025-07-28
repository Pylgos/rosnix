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
  version = "15.1.7-1";
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
        rev = "6a3d04ae8e112050cd0827875d6fc1c163a4168a";
        hash = "sha256-rGB/wBO6uvNtheUVWj/+dGUs86snaL5JfI9qbatlFhI=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for working with resources like meshes.";
  };
})
