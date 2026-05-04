{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mola-georeferencing,
  mola-gtsam-factors,
  mola-metric-maps,
  mola-pose-list,
  mola-relocalization,
  mola-test-datasets,
  mola-yaml,
  mp2p-icp,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libtclap,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_sm_loop_closure";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."mola_sm_loop_closure";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtsam mola-common mola-georeferencing mola-gtsam-factors mola-pose-list mola-relocalization mola-yaml mp2p-icp mrpt-libgui mrpt-libmaps mrpt-libtclap ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mola-georeferencing mola-gtsam-factors mola-pose-list mola-relocalization mola-yaml mp2p-icp mrpt-libgui mrpt-libmaps mrpt-libtclap ros-environment ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto mola-metric-maps mola-test-datasets ];
  passthru.sources = mkSourceSet (sources: {
    "mola_sm_loop_closure" = substituteSource {
      src = fetchgit {
        name = "mola_sm_loop_closure-source";
        url = "https://github.com/ros2-gbp/mola_sm_loop_closure-release.git";
        rev = "c914120a10b42346410ad90d5c8b857baf7e5fa4";
        hash = "sha256-emosaNFBAcc5VsyqVrcIqEfoE1NlarawEVeRo49od8g=";
      };
    };
  });
  meta = {
    description = "Simplemap loop-closure postprocessing library and CLI tool";
  };
})
