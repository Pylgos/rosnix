{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-dispenser-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_task_msgs";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_task_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rmf-dispenser-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rmf-dispenser-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_task_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_task_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "41f90ee86e21693589705577f53ecef97a7ba625";
        hash = "sha256-vKrBsMVxXhTnA5GXxo71etEpPcO3JAwYax++eCu+cnc=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to specify tasks";
  };
})
