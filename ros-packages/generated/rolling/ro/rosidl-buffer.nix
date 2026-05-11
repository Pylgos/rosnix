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
  version = "5.3.0-1";
  src = finalAttrs.passthru.sources."rosidl_buffer";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "544b744d0775dd51a76efd3da74ac57a44608547";
        hash = "sha256-GBortlaZ1YlkqKaYxEFpixqQWZ/hRlrGw1SjiovMPCY=";
      };
    };
  });
  meta = {
    description = "\n    Core Buffer types and implementations for ROS2 native buffer feature.\n    Provides Buffer container type with support for multiple memory backends (CPU, GPU, custom).\n  ";
  };
})
