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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_metric_maps";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  propagatedBuildInputs = [ mola-common mp2p-icp mrpt-libmaps ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_metric_maps" = substituteSource {
      src = fetchgit {
        name = "mola_metric_maps-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "9a942e7c6fc23b027af9db44c7da8bbdd7a15ae5";
        hash = "sha256-yTUZQYGfq8tIqMShFhB75l54AjpGqaSxqYdofgXxUX0=";
      };
    };
  });
  meta = {
    description = "Advanced metric map classes, using the generic `mrpt::maps::CMetricMap` interface, for use in other MOLA odometry and SLAM modules.";
  };
})
