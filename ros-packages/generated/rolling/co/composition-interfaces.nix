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
  version = "2.4.3-1";
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
        rev = "1ecf9e880c5235f588a51cdd0d4945c4a0e963cc";
        hash = "sha256-RAV8ishBriGF57BR8C1uRvvhGmBOnuVO2MvEzwSp5CE=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
})
