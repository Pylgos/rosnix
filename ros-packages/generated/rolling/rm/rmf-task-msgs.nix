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
  version = "4.0.0-1";
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
        rev = "a6bc788a799604f17535bbebca1c4927b6b9c84f";
        hash = "sha256-F3UjmvnkbZKqGVGpAcdm6Prle+G230fBEbSJ6ZIr/oc=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to specify tasks";
  };
})
