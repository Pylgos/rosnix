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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."statistics_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "statistics_msgs" = substituteSource {
      src = fetchgit {
        name = "statistics_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "56895ab09c1f7b1420d45dffa4e0dcb63aa42573";
        hash = "sha256-StmM/vqSkqqgg84bt4x/hUKy7R7QgDmBoDzsFvBrucw=";
      };
    };
  });
  meta = {
    description = "Message definitions for reporting statistics for topics and system resources.";
  };
})
