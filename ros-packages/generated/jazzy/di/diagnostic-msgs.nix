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
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."diagnostic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_msgs" = substituteSource {
      src = fetchgit {
        name = "diagnostic_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "2acf941fd8d1ca0aa5e22de6dbaee01208471ecb";
        hash = "sha256-VaNM6gL1W9xv0Z4CsOxSt4rBRHODNb3jf8pvyhdfjI8=";
      };
    };
  });
  meta = {
    description = "A package containing some diagnostics related message and service definitions.";
  };
})
