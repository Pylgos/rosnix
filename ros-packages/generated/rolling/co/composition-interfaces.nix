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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."composition_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rcl-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "composition_interfaces" = substituteSource {
        src = fetchgit {
          name = "composition_interfaces-source";
          url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
          rev = "b0fdee2634f93ebde7828118d72cb692daccee26";
          hash = "sha256-86vBOQKOSZvDC4nfmQVC7hKzgCQbCpdZSCADUMi0QC0=";
        };
      };
    });
  };
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
})
