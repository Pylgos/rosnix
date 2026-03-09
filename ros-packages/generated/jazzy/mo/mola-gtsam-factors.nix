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
  version = "2.2.0-1";
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
        rev = "c8d359f6838edf35dd4b8b9922554dee2d76fbba";
        hash = "sha256-89AJC20QLi/q8TGKW6yRMNS6ohkIgrj48Abix1nXKMM=";
      };
    };
  });
  meta = {
    description = "C++ library with reusable GTSAM Factors useful in georeferencing and state-estimation MOLA modules";
  };
})
