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
  pname = "ros2_control_cmake";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_control_cmake";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_cmake" = substituteSource {
      src = fetchgit {
        name = "ros2_control_cmake-source";
        url = "https://github.com/ros2-gbp/ros2_control_cmake-release.git";
        rev = "564d82f6b27191f484a40cbdce1b2e4d09a3010e";
        hash = "sha256-zYugKeA676faYe+F4+bWnmD6dHyfNIrkMzwiM6L3fbg=";
      };
    };
  });
  meta = {
    description = "Provides CMake macros used by the ros2_control framework";
  };
})
