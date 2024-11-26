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
  pname = "rmf_obstacle_msgs";
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_obstacle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_obstacle_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_obstacle_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "a796af42f093c36eab792b59b423a4d1f98c57f0";
        hash = "sha256-mxfaFAH5p/S3vxK4RdkH6kRiLSEWAyw4UfSCuD8DwBI=";
      };
    };
  });
  meta = {
    description = "A package containing messages for describing obstacles in the environment";
  };
})
