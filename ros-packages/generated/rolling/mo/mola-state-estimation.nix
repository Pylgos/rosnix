{
  ament-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-imu-preintegration,
  mola-state-estimation-simple,
  mola-state-estimation-smoother,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_state_estimation";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."mola_state_estimation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mola-imu-preintegration mola-state-estimation-simple mola-state-estimation-smoother ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "526ac91fc8dd73e041264b3a6993d4e7462be1d9";
        hash = "sha256-vXgVku43lAzBb5z3WhdN+V7I5kPG48W0vnQhQRiNTio=";
      };
    };
  });
  meta = {
    description = "Metapackage with all MOLA state estimation packages.";
  };
})
