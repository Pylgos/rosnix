{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "bond";
  version = "4.1.2-1";
  src = finalAttrs.passthru.sources."bond";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bond" = substituteSource {
      src = fetchgit {
        name = "bond-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "0a3dcb6e7595eedd0637eb1be7d8b829bdf87c97";
        hash = "sha256-NqU1+QF4UVBiEC4SwZeA538vTfWMzgX0LZ9/UKmvcEk=";
      };
    };
  });
  meta = {
    description = "\n    A bond allows two processes, A and B, to know when the other has\n    terminated, either cleanly or by crashing.  The bond remains\n    connected until it is either broken explicitly or until a\n    heartbeat times out.\n  ";
  };
})
