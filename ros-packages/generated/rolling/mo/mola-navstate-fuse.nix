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
  pname = "mola_navstate_fuse";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."mola_navstate_fuse";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-imu-preintegration mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_navstate_fuse" = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fuse-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "74067c6cd99fc984354119db0d4a586cf627b432";
        hash = "sha256-hyE9XaSmMO9K/yPHeBT7SbwFLkqY2dBY/QwhpuYvlwk=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
