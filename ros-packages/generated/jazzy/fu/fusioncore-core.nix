{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fusioncore_core";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."fusioncore_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_core" = substituteSource {
      src = fetchgit {
        name = "fusioncore_core-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "3beac54b9409c2e2e3a57fdf86df88d071361a7c";
        hash = "sha256-WCBGoEd9IAFjIJPc2YLZY7jzn9qk5lHGWGrquxTHGtg=";
      };
    };
  });
  meta = {
    description = "Pure C++ UKF sensor fusion library underlying FusionCore. Fuses IMU, wheel encoders and GPS in a 22-state unscented Kalman filter. Includes ECEF GPS conversion, IMU bias estimation, adaptive noise covariance, chi-squared outlier gating, and ZUPT. No ROS dependency, usable standalone.";
  };
})
