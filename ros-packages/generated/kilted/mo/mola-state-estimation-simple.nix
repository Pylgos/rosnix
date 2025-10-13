{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-imu-preintegration,
  mola-kernel,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_state_estimation_simple";
  version = "1.11.0-1";
  src = finalAttrs.passthru.sources."mola_state_estimation_simple";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-imu-preintegration mola-kernel mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-imu-preintegration mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation_simple" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation_simple-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "818a3b1ae92b758c49941ef6cbffc25c4c0962f4";
        hash = "sha256-HIeRjOaqTxgwdpk7oHabAXrPLH2g1mi4Gz67TKtW2F4=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
