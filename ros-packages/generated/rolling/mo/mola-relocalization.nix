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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_relocalization";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-pose-list mp2p-icp mrpt-libmaps mrpt-libobs mrpt-libslam ];
  checkInputs = [ mola-test-datasets ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_relocalization" = substituteSource {
        src = fetchgit {
          name = "mola_relocalization-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "ba4d7fa1a4fca062c9a831462ab09df8cd286957";
          hash = "sha256-fbPyWW6k874EYfr6gWdwf6D0CZP6VOq/rWAWL2Y3Muc=";
        };
      };
    });
  };
  meta = {
    description = "C++ library with algorithms for relocalization, global localization, or pose estimation given a large initial uncertainty";
  };
})
