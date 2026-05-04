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
  version = "2.2.0-2";
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
        rev = "ce2616f148cbc00b431c15265918cd71be6e4055";
        hash = "sha256-Wy0SeVhOXLOkGdVD1YPz+ZsiW13+yhe0CPzhBfvxYgM=";
      };
    };
  });
  meta = {
    description = "C++ library for georeferencing key-frame maps (simplemaps) and related CLI tools";
  };
})
