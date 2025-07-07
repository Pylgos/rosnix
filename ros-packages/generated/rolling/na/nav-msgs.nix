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
  pname = "nav_msgs";
  version = "5.8.1-1";
  src = finalAttrs.passthru.sources."nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav_msgs" = substituteSource {
      src = fetchgit {
        name = "nav_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "166a26a98d3645a0a856ff8907c2af0aa3d552ca";
        hash = "sha256-EI8QUMht08woB5K2oPaZ7IMDj3ZjJD1NUziof/aS+Gc=";
      };
    };
  });
  meta = {
    description = "A package containing some navigation related message and service definitions.";
  };
})
