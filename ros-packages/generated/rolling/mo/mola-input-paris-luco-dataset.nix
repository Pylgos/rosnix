{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmaps,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_paris_luco_dataset";
  version = "1.6.2-1";
  src = finalAttrs.passthru.sources."mola_input_paris_luco_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_paris_luco_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_paris_luco_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "4ec4dfc451608b4cf345beb9c54c32774ef8c05e";
        hash = "sha256-HxlHdmxyi5fvKofwVED4PAghyMmmhldyKFmyn6iEelc=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Paris LUCO (CT-ICP) odometry/SLAM datasets";
  };
})
