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
  pname = "rmf_scheduler_msgs";
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_scheduler_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_scheduler_msgs" = substituteSource {
        src = fetchgit {
          name = "rmf_scheduler_msgs-source";
          url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
          rev = "ec92a0656c5e758e74c5ff4773cbe8ed24b91d33";
          hash = "sha256-BLugMH1dCJbTLgCKvbTBILeO9aMEYSMIvy193XTz9XI=";
        };
      };
    });
  };
  meta = {
    description = "Messages used by rmf_scheduler_msgs";
  };
})
