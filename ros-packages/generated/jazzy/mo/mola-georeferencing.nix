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
  version = "2.3.1-1";
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
        rev = "ba5dad160ae36985f34a369d21caa38963234b1f";
        hash = "sha256-F/4rEJnuMRLWQ3EGy/krea96s4NpXUTSiD9y27j3KrA=";
      };
    };
  });
  meta = {
    description = "C++ library for georeferencing key-frame maps (simplemaps) and related CLI tools";
  };
})
