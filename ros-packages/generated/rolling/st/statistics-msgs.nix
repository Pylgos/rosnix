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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."statistics_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "statistics_msgs" = substituteSource {
      src = fetchgit {
        name = "statistics_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "74feec2ad78ea7e03fd3fc1baaa42a2b0adb6de9";
        hash = "sha256-S3ndo0vvL9lR/6VcVB2dHLoNTR9zOHdqiyzUxDsmwVQ=";
      };
    };
  });
  meta = {
    description = "Message definitions for reporting statistics for topics and system resources.";
  };
})
