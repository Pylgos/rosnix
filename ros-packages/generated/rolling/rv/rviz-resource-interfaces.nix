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
  version = "15.1.15-1";
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
        rev = "d3fe48d5894025e51a57509835281109c4f98ac8";
        hash = "sha256-w2J41YX9AGETmQ7qAhI0/y1YEhEtO7u+WCIaLvRnR8w=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for working with resources like meshes.";
  };
})
