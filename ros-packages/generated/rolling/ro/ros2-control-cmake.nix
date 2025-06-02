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
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."ros2_control_cmake";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_cmake" = substituteSource {
      src = fetchgit {
        name = "ros2_control_cmake-source";
        url = "https://github.com/ros2-gbp/ros2_control_cmake-release.git";
        rev = "92afdd93e4be9662359a55e6e7dbee7743eb4e60";
        hash = "sha256-VJAAQjwPrBJ5s+QTIbhodNdywPfEhKjuryGGAX68hv4=";
      };
    };
  });
  meta = {
    description = "Provides CMake macros used by the ros2_control framework";
  };
})
