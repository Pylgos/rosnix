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
  version = "15.0.9-1";
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
        rev = "c511a9c465cc26d6e3674ade87896b2607af509a";
        hash = "sha256-cMLfYERii6xQsAzUpIVdk460Ie1OpL/hly4+PCowWbE=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for working with resources like meshes.";
  };
})
