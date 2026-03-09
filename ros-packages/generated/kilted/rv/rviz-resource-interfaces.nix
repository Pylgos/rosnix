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
  version = "15.0.12-1";
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
        rev = "2bbbd2729b9e5a60d2683d223c3afaaec949f54b";
        hash = "sha256-BSfYREr/OdfXEkZbWz2wFmtwDq0pOrk1RZLy3f2FgT8=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for working with resources like meshes.";
  };
})
