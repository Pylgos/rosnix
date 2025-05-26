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
  version = "2.4.8-1";
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
        rev = "1dbf59801b92b3dec2fc9a670d89cfd83afa1b9b";
        hash = "sha256-C9J+/9x463/xU5v33fYERS2Fqpvvd8z9pf+ufX1F2Vs=";
      };
    };
  });
  meta = {
    description = "\n     ROS interfaces used by Mapviz\n  ";
  };
})
