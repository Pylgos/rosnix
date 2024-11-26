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
  qt-gui-cpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildCmakePackage (finalAttrs: {
  pname = "rtabmap";
  version = "0.21.6-1";
  src = finalAttrs.passthru.sources."rtabmap";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge gtsam libg2o libpointmatcher qt-gui-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libsqlite3-dev" "proj" "tbb" "zlib" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rtabmap" = substituteSource {
        src = fetchgit {
          name = "rtabmap-source";
          url = "https://github.com/ros2-gbp/rtabmap-release.git";
          rev = "1c72d1b144d6c524ce0b66e3307e6c3c6fb188e0";
          hash = "sha256-wF68y0YveuAPXq2DOgb4KGYuCN0GovrczL95nNpGLC0=";
        };
      };
    });
  };
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
})
