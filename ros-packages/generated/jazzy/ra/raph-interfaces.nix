{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
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
  pname = "raph_interfaces";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."raph_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_interfaces" = substituteSource {
      src = fetchgit {
        name = "raph_interfaces-source";
        url = "https://github.com/ros2-gbp/raph_common-release.git";
        rev = "b2f3d40c466af911653356edc43926c3e85f5560";
        hash = "sha256-j8sZpICF+/cnqqAk5qd56kn3TpckuGBoyGOsUMcU/3Q=";
      };
    };
  });
  meta = {
    description = "\n    Interface definitions for Raph Rover\n  ";
  };
})
