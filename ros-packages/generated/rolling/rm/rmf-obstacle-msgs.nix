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
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rmf_obstacle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_obstacle_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_obstacle_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "4b907ca4c15b204a1097a5e9f38d430fb76972e1";
        hash = "sha256-UKEHuwdggws/eMLuAjvyufa1SRMwAuuU1ULSPLoPC8Y=";
      };
    };
  });
  meta = {
    description = "A package containing messages for describing obstacles in the environment";
  };
})
