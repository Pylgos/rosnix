{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rot_conv";
  version = "1.1.0-4";
  src = finalAttrs.passthru.sources."rot_conv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rot_conv" = substituteSource {
      src = fetchgit {
        name = "rot_conv-source";
        url = "https://github.com/ros2-gbp/rot_conv_lib-release.git";
        rev = "42575b7a752caa6bcff62455b34f4e589c17ab06";
        hash = "sha256-VqbATzeNKPD8JPuhSHw/tFUaehAd/D5z7SlyxRL1P9w=";
      };
    };
  });
  meta = {
    description = "A collection of functions that address common computations and numerical handling of rotations in 3D Euclidean space";
  };
})
