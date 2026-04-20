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
  pname = "nebula_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_msgs";
  nativeBuildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_msgs" = substituteSource {
      src = fetchgit {
        name = "nebula_msgs-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "c5df00f718043a4d4a9052fcd342ae80a8a414e9";
        hash = "sha256-AAW7UUg4tE5Drt2Z8N8J7i6DMXosXKEzZ7p/BOhbq3o=";
      };
    };
  });
  meta = {
    description = "Generic sensor raw data messages for Nebula";
  };
})
