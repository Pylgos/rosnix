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
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_task_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rmf-dispenser-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_task_msgs" = substituteSource {
        src = fetchgit {
          name = "rmf_task_msgs-source";
          url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
          rev = "8c3afc71eb9b2ad7f5e6853cedbb0013ad110337";
          hash = "sha256-/hT+jeQZaC1FhffhkaFh+XaMshLsJO3TruueWB+syIU=";
        };
      };
    });
  };
  meta = {
    description = "A package containing messages used to specify tasks";
  };
})
