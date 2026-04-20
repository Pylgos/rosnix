{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_cmake";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_cmake";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_cmake" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_cmake-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "f125084f716ba365751af9d262b671e1b8f91d6f";
        hash = "sha256-gpeEpKEPQTK8ryOfJ5JY4a6fh2HvyQ+lHVV6M1eFn8s=";
      };
    };
  });
  meta = {
    description = "Shared CMake modules for ros2_medkit packages (multi-distro compat, ccache, linting)";
  };
})
