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
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."statistics_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "statistics_msgs" = substituteSource {
      src = fetchgit {
        name = "statistics_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "63410c9e1e1ea22b87c3dfdd539523cd0f1c15d2";
        hash = "sha256-Wd0Yn/GW1ILcvVkV+yQqkgpTZnbMVUjjwAi7hpDoTes=";
      };
    };
  });
  meta = {
    description = "Message definitions for reporting statistics for topics and system resources.";
  };
})
