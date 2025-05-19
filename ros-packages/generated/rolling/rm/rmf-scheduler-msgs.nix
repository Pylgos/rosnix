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
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_scheduler_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_scheduler_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_scheduler_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "d51f8dbc5111e01c4bdf4872c4dad65b719f0256";
        hash = "sha256-RomqmOz47NY856jhPlQaO00BuDH31ypt/S8x+yyEKCI=";
      };
    };
  });
  meta = {
    description = "Messages used by rmf_scheduler_msgs";
  };
})
