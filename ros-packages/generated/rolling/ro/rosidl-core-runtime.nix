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
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."rosidl_core_runtime";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_core_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_core_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "b7f8444328add845ae28f0cd337fb0440df0833a";
        hash = "sha256-Tx/+GBL77yQLb3fWL+680aiPQpZDbyymgla6/5likPU=";
      };
    };
  });
  meta = {
    description = "A configuration package defining runtime dependencies for core ROS interfaces.";
  };
})
