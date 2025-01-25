{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cob_srvs";
  version = "2.8.12-1";
  src = finalAttrs.passthru.sources."cob_srvs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cob_srvs" = substituteSource {
      src = fetchgit {
        name = "cob_srvs-source";
        url = "https://github.com/ros2-gbp/cob_common-release.git";
        rev = "dbc194274f078105a3d0659bcae4afe489172461";
        hash = "sha256-ZgYxDwkAxxA/1jvMWOAfiTeOOihhwYiU+jJlE5574CM=";
      };
    };
  });
  meta = {
    description = "This Package contains Care-O-bot specific service definitions.";
  };
})
