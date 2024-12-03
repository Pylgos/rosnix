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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge gtsam libg2o libpointmatcher qt-gui-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libsqlite3-dev" "proj" "tbb" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap" = substituteSource {
      src = fetchgit {
        name = "rtabmap-source";
        url = "https://github.com/ros2-gbp/rtabmap-release.git";
        rev = "0a44e5107f939cc0c5369347fa038bcbbd54e2ff";
        hash = "sha256-InwFcOAuaK1u6szvgxE1/NvqMvYLp3VYFp65rFOLreY=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
})
