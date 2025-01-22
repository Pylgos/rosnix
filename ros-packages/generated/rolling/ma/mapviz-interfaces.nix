{
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  marti-common-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mapviz_interfaces";
  version = "2.4.5-1";
  src = finalAttrs.passthru.sources."mapviz_interfaces";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces marti-common-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mapviz_interfaces" = substituteSource {
      src = fetchgit {
        name = "mapviz_interfaces-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "2df290c9b309e8cb999044d0198065e21e8dd665";
        hash = "sha256-vaWMjuF5uS7sb4sbTQK+1y6B6UepobUpoeHnNkGmEfM=";
      };
    };
  });
  meta = {
    description = "ROS interfaces used by Mapviz";
  };
})
