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
  version = "2.4.3-1";
  src = finalAttrs.passthru.sources."mapviz_interfaces";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces marti-common-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mapviz_interfaces" = substituteSource {
      src = fetchgit {
        name = "mapviz_interfaces-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "3a23dd0f1d7f400364a73c54985ad221039a05d9";
        hash = "sha256-69Y5+FasOKVL+kZGv8GjgS4SHUvQb42Cr12PmzVZngY=";
      };
    };
  });
  meta = {
    description = "ROS interfaces used by Mapviz";
  };
})
