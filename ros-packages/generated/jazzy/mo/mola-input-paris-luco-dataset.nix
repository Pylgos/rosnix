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
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."mola_input_paris_luco_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_paris_luco_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_paris_luco_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "4424f5d183bf09ab7f9bb7d2c5a4a9d56c4bf14c";
        hash = "sha256-zhNLcc4d6O5nI+1ZIQOjX5Kkz/Mjm65+hLtlO0niPqg=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Paris LUCO (CT-ICP) odometry/SLAM datasets";
  };
})
