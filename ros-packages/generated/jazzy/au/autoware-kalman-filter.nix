{
  ament-cmake-auto,
  ament-cmake-cppcheck,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
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
  pname = "autoware_kalman_filter";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_kalman_filter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_kalman_filter" = substituteSource {
      src = fetchgit {
        name = "autoware_kalman_filter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "79cce964859753b2255400d586075996fce6a5f7";
        hash = "sha256-4YUlJsoFkWYtTU7q7pKd21ptv3OGdDAOOV+k2DWyRfo=";
      };
    };
  });
  meta = {
    description = "The kalman filter package";
  };
})
