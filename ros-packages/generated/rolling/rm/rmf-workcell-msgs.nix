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
  pname = "rmf_workcell_msgs";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_workcell_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_workcell_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_workcell_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "40675f99d550df56ff9cdaeb10b0daef9ad0c50a";
        hash = "sha256-rbKgEpz2d6px6O0v/lv8WOrMBxceZbKcXrXJls2B5zE=";
      };
    };
  });
  meta = {
    description = "A package containing messages used by all workcells generically to interfact with rmf_core";
  };
})
