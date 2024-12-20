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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."mola_relocalization";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-pose-list mp2p-icp mrpt-libmaps mrpt-libobs mrpt-libslam ];
  checkInputs = [ mola-test-datasets ];
  passthru.sources = mkSourceSet (sources: {
    "mola_relocalization" = substituteSource {
      src = fetchgit {
        name = "mola_relocalization-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "3adc77bc118223bceeaf781c83e1375dd852aadd";
        hash = "sha256-ZB+mWIOIkwRA6YMXZDUif7UBAjm70q438Saq4j9V3iM=";
      };
    };
  });
  meta = {
    description = "C++ library with algorithms for relocalization, global localization, or pose estimation given a large initial uncertainty";
  };
})
