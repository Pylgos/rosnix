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
  version = "1.10.0-1";
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
        rev = "75efa8c31de4a40e14ea702ea569a1d72207d1a0";
        hash = "sha256-UmAf8+Ua1ua6sHwNuUh1gVgxgN/h4P1FIC84PC5ykjY=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
