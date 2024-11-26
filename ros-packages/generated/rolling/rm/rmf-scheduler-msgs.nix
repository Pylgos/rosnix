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
  version = "3.4.1-1";
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
          rev = "225b627d58f9f5526661022613dabdd10ebba38b";
          hash = "sha256-ILJ75Bs2geMLMXleLmqfg5SD7C88+AcODvq1Bfd9L1w=";
        };
      };
    });
  };
  meta = {
    description = "Messages used by rmf_scheduler_msgs";
  };
})
