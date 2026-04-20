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
  version = "2.6.2-1";
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
        rev = "053c2fdb1fcd6dcdc26a6b970f027ea5fdc2b301";
        hash = "sha256-GKiLigJ3Oda557IHdBwc0ZwAU3WwEA+z3L0U3faDuEg=";
      };
    };
  });
  meta = {
    description = "\n     ROS interfaces used by Mapviz\n  ";
  };
})
