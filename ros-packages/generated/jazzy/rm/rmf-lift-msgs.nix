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
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_lift_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_lift_msgs" = substituteSource {
        src = fetchgit {
          name = "rmf_lift_msgs-source";
          url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
          rev = "7bde0e3a44aa28f48a200305762f4dbb81636c08";
          hash = "sha256-nOEHLKOFOfoESrFoDSQcXcBWu20rgvI33o0DoeC9IE4=";
        };
      };
    });
  };
  meta = {
    description = "Messages used to interface to lifts.";
  };
})
