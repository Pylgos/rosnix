{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-pose-list,
  mola-test-datasets,
  mp2p-icp,
  mrpt-libmaps,
  mrpt-libobs,
  mrpt-libslam,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_relocalization";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."mola_relocalization";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-pose-list mp2p-icp mrpt-libmaps mrpt-libobs mrpt-libslam ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-pose-list mp2p-icp mrpt-libmaps mrpt-libobs mrpt-libslam ];
  checkInputs = [ mola-test-datasets ];
  passthru.sources = mkSourceSet (sources: {
    "mola_relocalization" = substituteSource {
      src = fetchgit {
        name = "mola_relocalization-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "f97fefdf525c0064c37bcec988c70a3ed9cedfbb";
        hash = "sha256-P8LM3/Z0+ck5VXLIZBncOcfbL6V13A8Sm3HMPBRfmQ0=";
      };
    };
  });
  meta = {
    description = "C++ library with algorithms for relocalization, global localization, or pose estimation given a large initial uncertainty";
  };
})
