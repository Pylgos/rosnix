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
  version = "2.1.0-1";
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
        rev = "c11be6adc2d3c2efb76068a46d15e2bbf6711695";
        hash = "sha256-TtVG6pDEzaSL9uSlEWsZZMycWr3EL5RjnhiWwYWLo58=";
      };
    };
  });
  meta = {
    description = "C++ library for georeferencing key-frame maps (simplemaps) and related CLI tools";
  };
})
