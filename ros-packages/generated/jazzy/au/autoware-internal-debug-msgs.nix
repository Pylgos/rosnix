{
  ament-cmake-auto,
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
  pname = "autoware_internal_debug_msgs";
  version = "1.5.0-2";
  src = finalAttrs.passthru.sources."autoware_internal_debug_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_debug_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_debug_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "ea2e9c8b2d646ea80ebc30a0ec562f6df71ab1aa";
        hash = "sha256-YLBeLQsdJoT2ESH85b6pnavEPipj0uegGxhCbnmFWiQ=";
      };
    };
  });
  meta = {
    description = "Autoware internal debug messages package.";
  };
})
