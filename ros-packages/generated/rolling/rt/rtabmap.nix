{
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  libg2o,
  libpointmatcher,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rtabmap";
  version = "0.21.6-1";
  src = finalAttrs.passthru.sources."rtabmap";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ cv-bridge gtsam libg2o libpointmatcher ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libsqlite3-dev" "proj" "qtbase5-dev" "tbb" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge gtsam libg2o libpointmatcher ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libsqlite3-dev" "proj" "qtbase5-dev" "tbb" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap" = substituteSource {
      src = fetchgit {
        name = "rtabmap-source";
        url = "https://github.com/ros2-gbp/rtabmap-release.git";
        rev = "2b006d498b6df04f4dcddf01fe1d9d90e94570e8";
        hash = "sha256-dg5NbiIJYYT3CPzwPwMVxK1ag4M310PlkRCB5iNkHHs=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
})
