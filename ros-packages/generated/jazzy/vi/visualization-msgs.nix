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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "visualization_msgs";
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."visualization_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "visualization_msgs" = substituteSource {
      src = fetchgit {
        name = "visualization_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "129eac1285a1f1df2afb99ef6e130968fa7f287c";
        hash = "sha256-9hi9fbYKjuHxGMO+Oiykg7g21bDIVNc5sK/cmoS3SEg=";
      };
    };
  });
  meta = {
    description = "A package containing some visualization and interaction related message definitions.";
  };
})
