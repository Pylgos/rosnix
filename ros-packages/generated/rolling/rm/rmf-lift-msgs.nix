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
  pname = "rmf_lift_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rmf_lift_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_lift_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_lift_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "a6902ae943d680a23fcb458642719fd6b92eac46";
        hash = "sha256-XqmowkmwUNpn/ohBekNkNs9A0ks2O1RdKUDfTMHN3Yg=";
      };
    };
  });
  meta = {
    description = "Messages used to interface to lifts.";
  };
})
