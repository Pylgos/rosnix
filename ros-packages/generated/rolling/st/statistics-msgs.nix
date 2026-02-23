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
  version = "2.4.3-1";
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
        rev = "d50763267b162340ac95ccc96f5651ec80232923";
        hash = "sha256-Fww2rW0M2XXPqxeQzpC9Z2d4HAz7VJJ3ULeJ6d5gnrc=";
      };
    };
  });
  meta = {
    description = "Message definitions for reporting statistics for topics and system resources.";
  };
})
