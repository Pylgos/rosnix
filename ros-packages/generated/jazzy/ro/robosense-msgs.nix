{
  autoware-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robosense_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."robosense_msgs";
  nativeBuildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "robosense_msgs" = substituteSource {
      src = fetchgit {
        name = "robosense_msgs-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "d6e96c51d48dabed66794a6b173cb1376d72c669";
        hash = "sha256-WdmJI771NPtl7b5dWBK9VgT/pXhL0Ai+icXpbAmW9ro=";
      };
    };
  });
  meta = {
    description = "Robosense message types for Nebula";
  };
})
