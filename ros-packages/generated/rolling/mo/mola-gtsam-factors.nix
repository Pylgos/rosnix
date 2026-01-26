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
  version = "2.0.0-1";
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
        rev = "d27d5d10a214a405a274b224bb3b413801a6b0c5";
        hash = "sha256-rr3109N2et1G2XdSU046+wFW+6/EiZGM9PNCbzqp8ew=";
      };
    };
  });
  meta = {
    description = "C++ library with reusable GTSAM Factors useful in georeferencing and state-estimation MOLA modules";
  };
})
