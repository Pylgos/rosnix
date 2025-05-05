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
  version = "1.8.0-1";
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
        rev = "1107a108c9de33943f566d54b97a020cec3a4c5f";
        hash = "sha256-/AIKvv+Xb23mDVbg/E5OoK+mlz50Q8cBLsTdoQHhf10=";
      };
    };
  });
  meta = {
    description = "Metapackage with all MOLA state estimation packages.";
  };
})
