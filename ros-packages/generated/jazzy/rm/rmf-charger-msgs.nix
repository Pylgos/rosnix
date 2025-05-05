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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_charger_msgs";
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_charger_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_charger_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_charger_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "bde00fd01965a9e0f8702937a3c1cdd750ecfdc4";
        hash = "sha256-NFjgcKNZ79NPI7w721r0OF/bLq+8h5uaCacJvl1iS9A=";
      };
    };
  });
  meta = {
    description = "This package contains messages regarding charging and discharging";
  };
})
