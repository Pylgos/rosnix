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
  pname = "statistics_msgs";
  version = "2.0.2-2";
  src = finalAttrs.passthru.sources."statistics_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "statistics_msgs" = substituteSource {
        src = fetchgit {
          name = "statistics_msgs-source";
          url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
          rev = "bf5c981ef3868ed225cf3f713e4724c67397ae4c";
          hash = "sha256-UcbiXBuVNpueB6FiqFoeqrJbmQb7HE6x1f4ZWlQ2U7U=";
        };
      };
    });
  };
  meta = {
    description = "Message definitions for reporting statistics for topics and system resources.";
  };
})
