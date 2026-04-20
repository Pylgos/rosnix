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
  version = "0.4.2-1";
  src = finalAttrs.passthru.sources."rosidl_core_runtime";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_core_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_core_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "497dfbc64e06773584e4765c79cceefa36c4fcb3";
        hash = "sha256-4aaccQt07ywoeLcSRxezmPm0jM6t+xYQ1cCYJoQ6NU8=";
      };
    };
  });
  meta = {
    description = "A configuration package defining runtime dependencies for core ROS interfaces.";
  };
})
