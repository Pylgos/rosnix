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
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."bond";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bond" = substituteSource {
      src = fetchgit {
        name = "bond-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "ef14f8df594843cad635278c35a496bc76cf3e06";
        hash = "sha256-HumzPokICAnb7HyYW4rIhMDSZ8ZnZ+tzQ6LqYn9/dDU=";
      };
    };
  });
  meta = {
    description = "A bond allows two processes, A and B, to know when the other has terminated, either cleanly or by crashing. The bond remains connected until it is either broken explicitly or until a heartbeat times out.";
  };
})
