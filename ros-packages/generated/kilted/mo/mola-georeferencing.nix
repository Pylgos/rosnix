{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mola-gtsam-factors,
  mola-yaml,
  mp2p-icp,
  mrpt-libmaps,
  mrpt-libtclap,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_georeferencing";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."mola_georeferencing";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtsam mola-common mola-gtsam-factors mola-yaml mp2p-icp mrpt-libmaps mrpt-libtclap ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mola-gtsam-factors mola-yaml mp2p-icp mrpt-libmaps mrpt-libtclap ];
  passthru.sources = mkSourceSet (sources: {
    "mola_georeferencing" = substituteSource {
      src = fetchgit {
        name = "mola_georeferencing-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "e935ff684c577c029481172ae6f99a0f6ea0db58";
        hash = "sha256-6dTfNEq8co+p3cNw1UnONNdy9w4dIG5zjGHbe2Fn7BU=";
      };
    };
  });
  meta = {
    description = "C++ library for georeferencing key-frame maps (simplemaps) and related CLI tools";
  };
})
