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
  version = "2.0.2-2";
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
          rev = "7c7e9ce9c33e3d9920ce099ede290d836642e111";
          hash = "sha256-YTmCcgVPa5sosZzoRmcBvPGUebFIGOCK8SjI0aGXMRU=";
        };
      };
    });
  };
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
})
