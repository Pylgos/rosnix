{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostic_msgs";
  version = "5.3.6-1";
  src = finalAttrs.passthru.sources."diagnostic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_msgs" = substituteSource {
      src = fetchgit {
        name = "diagnostic_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "48600840471e1275f27e09748a9e64d3bbee79aa";
        hash = "sha256-PnCPBULf14eaP2B9TixhQfxRki2TS2e0C6bk5DS51P0=";
      };
    };
  });
  meta = {
    description = "A package containing some diagnostics related message and service definitions.";
  };
})
