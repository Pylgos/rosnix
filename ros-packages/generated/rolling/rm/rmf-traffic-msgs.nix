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
  pname = "rmf_traffic_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "c08a5e881f1d3478274e83717d67575c83decfbe";
        hash = "sha256-ufUlJNdMupqSBtnKob2fQlA9WwjcLdh75IqaSSqizeE=";
      };
    };
  });
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
})
