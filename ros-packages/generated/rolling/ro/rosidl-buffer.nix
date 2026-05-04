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
  version = "5.2.0-2";
  src = finalAttrs.passthru.sources."rosidl_buffer";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "b6e0a9afe5feb624b1ee81bb432139aaefe3b3a8";
        hash = "sha256-c0DsBvuxY/ezdACVgOzUvyfMMRvlX53QwV+cQuRk3oQ=";
      };
    };
  });
  meta = {
    description = "\n    Core Buffer types and implementations for ROS2 native buffer feature.\n    Provides Buffer container type with support for multiple memory backends (CPU, GPU, custom).\n  ";
  };
})
