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
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."mola_input_paris_luco_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_paris_luco_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_paris_luco_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "72f2bdfb9c92b1117168812c2b39d3126247fff2";
        hash = "sha256-rxB+dZJltDh3NShyPO7UMuNlGbXTOdCALB1C/g1p/dk=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Paris LUCO (CT-ICP) odometry/SLAM datasets";
  };
})
