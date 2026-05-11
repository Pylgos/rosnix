{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_gtsam_factors";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."mola_gtsam_factors";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtsam mola-common mrpt-libposes ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_gtsam_factors" = substituteSource {
      src = fetchgit {
        name = "mola_gtsam_factors-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "0abdb521d5f489e58b797e8e3d9f116a4984843b";
        hash = "sha256-UtixtRu9tOt5dpHTB4H62rZzhoz/TA/IEu4FYYBwueQ=";
      };
    };
  });
  meta = {
    description = "C++ library with reusable GTSAM Factors useful in georeferencing and state-estimation MOLA modules";
  };
})
