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
  rmf-dispenser-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_ingestor_msgs";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_ingestor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rmf-dispenser-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rmf-dispenser-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_ingestor_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_ingestor_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "f8bc9c40b1ec918454f889cc5a5b0d681251fa9b";
        hash = "sha256-eCOrvSO8P2w41PbvRPxNYcanE+Zi43F/RQPCyhKc9G4=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to ingestor workcells";
  };
})
