{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mp2p-icp,
  mrpt-libmaps,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_metric_maps";
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."mola_metric_maps";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint mola-common mp2p-icp mrpt-libmaps ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint mola-common mp2p-icp mrpt-libmaps ros-environment ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_metric_maps" = substituteSource {
      src = fetchgit {
        name = "mola_metric_maps-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "5d2b38bd4eb95b886ff0ead35236afb2dadeeb84";
        hash = "sha256-FPeJUbbSQaNfXOvChCD6fAOsODGJ4uYE8yotMWW8fNI=";
      };
    };
  });
  meta = {
    description = "Advanced metric map classes, using the generic `mrpt::maps::CMetricMap` interface, for use in other MOLA odometry and SLAM modules.";
  };
})
