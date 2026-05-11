{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "composition_interfaces";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."composition_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rcl-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rcl-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "composition_interfaces" = substituteSource {
      src = fetchgit {
        name = "composition_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "0c061cfe225f28c5bfe0ead9d07a33a9f767de1b";
        hash = "sha256-9n9bwnt1uJVafZ0dbW+oUfJvKNmJkh9vKGd/C0efs0c=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
})
