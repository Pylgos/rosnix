{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_msgs";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."rmf_visualization_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization_msgs-release.git";
        rev = "7b107b018fad7d99d9c691d45415999f9debb04d";
        hash = "sha256-5vCaDnG4VwG8KZl0dVZzN0hUxcShW5mwtlwFt6ktAk4=";
      };
    };
  });
  meta = {
    description = "A package containing messages used for visualizations";
  };
})
