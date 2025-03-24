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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav_msgs";
  version = "5.5.0-1";
  src = finalAttrs.passthru.sources."nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav_msgs" = substituteSource {
      src = fetchgit {
        name = "nav_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "8f47f38b0687b18dad15a2335f0d876dd12a9f09";
        hash = "sha256-2ha1KM5riYuqR/4ejcZydLC90zHluICfvlDmdDbUZpg=";
      };
    };
  });
  meta = {
    description = "A package containing some navigation related message and service definitions.";
  };
})
