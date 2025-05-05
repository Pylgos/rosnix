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
  pname = "rmf_workcell_msgs";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rmf_workcell_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_workcell_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_workcell_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "4779545955c501b7875c7a3aad821b1e6f46e87e";
        hash = "sha256-V1i2BgR1tHJMYTrERQS7lzeo7VBFtPUmEdXRdDARPuQ=";
      };
    };
  });
  meta = {
    description = "A package containing messages used by all workcells generically to interfact with rmf_core";
  };
})
