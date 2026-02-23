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
  version = "2.3.1-1";
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
        rev = "3b058a62aa02c26c5113c84cab8413c8ab398aa1";
        hash = "sha256-YZMw+2B89EXdb1j3+KyQLhjmnz/+bMP2bAtmTuiKO5M=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
})
