{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_python";
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_python";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_python" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_python-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "3af1fe8eeb1cd05a19e9d35d2356247b3277c576";
          hash = "sha256-pBQquv6pNDPWHZ5Bd454RyTXLa1f+h81olEcIzDZeWM=";
        };
      };
    });
  };
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
})
