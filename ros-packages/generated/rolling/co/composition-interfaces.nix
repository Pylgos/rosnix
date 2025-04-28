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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."composition_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rcl-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "composition_interfaces" = substituteSource {
      src = fetchgit {
        name = "composition_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "109199c07bef1282d896b0538d7def5d3aca7d8c";
        hash = "sha256-ShfIm6HgTSnMV556UiiAtbOpLXgDmtLrAVeeaxC1kHo=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
})
