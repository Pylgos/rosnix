{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_core_runtime";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rosidl_core_runtime";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_core_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_core_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "e44f669ca2cb7b448131179db7420a89f361215d";
        hash = "sha256-brgzKUX/9eb/LzwI3HSRmoXpGOEMsh6QDVFN0wpoyNc=";
      };
    };
  });
  meta = {
    description = "A configuration package defining runtime dependencies for core ROS interfaces.";
  };
})
