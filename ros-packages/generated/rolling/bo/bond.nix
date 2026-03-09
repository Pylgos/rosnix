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
  version = "4.1.3-1";
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
        rev = "dda0674813bee610d1cfe3e7033d745fe5da2d18";
        hash = "sha256-dQXNzBqgPpIVYg4ms864FIoQDHDsq4KBRtKUVRrwPus=";
      };
    };
  });
  meta = {
    description = "\n    A bond allows two processes, A and B, to know when the other has\n    terminated, either cleanly or by crashing.  The bond remains\n    connected until it is either broken explicitly or until a\n    heartbeat times out.\n  ";
  };
})
