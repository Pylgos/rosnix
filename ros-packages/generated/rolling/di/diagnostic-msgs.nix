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
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."diagnostic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "diagnostic_msgs" = substituteSource {
        src = fetchgit {
          name = "diagnostic_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "ded412b198d934ca9daab1b0042fd3170d486f37";
          hash = "sha256-D6PP0gKQym8xngbmdgsxQY/9sid00iSPsu+8VgvmouA=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some diagnostics related message and service definitions.";
  };
})
