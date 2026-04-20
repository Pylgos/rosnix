{
  ament-cmake,
  ament-cmake-gtest,
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
  pname = "rosidl_buffer";
  version = "5.1.4-2";
  src = finalAttrs.passthru.sources."rosidl_buffer";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "d8a5ab3693369684e666641a8996b1e069341c06";
        hash = "sha256-H0x+lEvlxvMqBQSgolRu1q5gJQf5lTWB/0IkRvh/I+w=";
      };
    };
  });
  meta = {
    description = "\n    Core Buffer types and implementations for ROS2 native buffer feature.\n    Provides Buffer container type with support for multiple memory backends (CPU, GPU, custom).\n  ";
  };
})
