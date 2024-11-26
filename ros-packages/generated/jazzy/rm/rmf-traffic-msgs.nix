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
  pname = "rmf_traffic_msgs";
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_traffic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_traffic_msgs" = substituteSource {
        src = fetchgit {
          name = "rmf_traffic_msgs-source";
          url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
          rev = "878206895e1dcdf7c0b21dd41f0953e0bebf5991";
          hash = "sha256-AFZalqcapZOxO9m3KqMakovAIUJNb5ucV403kSXzvQ0=";
        };
      };
    });
  };
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
})
