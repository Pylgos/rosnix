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
  version = "1.8.1-1";
  src = finalAttrs.passthru.sources."mola_state_estimation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mola-imu-preintegration mola-state-estimation-simple mola-state-estimation-smoother ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mola-imu-preintegration mola-state-estimation-simple mola-state-estimation-smoother ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "d7f0d8da1333fa8afb6bc4f0bb4e2c29919fd894";
        hash = "sha256-AB2bvz5z8KPc+xAAQVcyMwwclOcHfgkLLwLPF0iObrc=";
      };
    };
  });
  meta = {
    description = "Metapackage with all MOLA state estimation packages.";
  };
})
