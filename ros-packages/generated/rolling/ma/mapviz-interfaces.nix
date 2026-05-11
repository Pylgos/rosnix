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
  version = "2.6.3-4";
  src = finalAttrs.passthru.sources."mapviz_interfaces";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces marti-common-msgs rosidl-default-runtime ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces marti-common-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "mapviz_interfaces" = substituteSource {
      src = fetchgit {
        name = "mapviz_interfaces-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "23380db66590b7d1fd2cab4407ad1b0ffdd661a5";
        hash = "sha256-elAjh7zSi27xVMhbg+nV2Y+c7v1dBfA6AT14aB/hqtY=";
      };
    };
  });
  meta = {
    description = "\n     ROS interfaces used by Mapviz\n  ";
  };
})
