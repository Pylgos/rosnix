{
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  libg2o,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rtabmap";
  version = "0.22.1-2";
  src = finalAttrs.passthru.sources."rtabmap";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ cv-bridge gtsam libg2o ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libpointmatcher" "libsqlite3-dev" "proj" "qtbase5-dev" "tbb" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge gtsam libg2o ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libpointmatcher" "libsqlite3-dev" "proj" "qtbase5-dev" "tbb" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap" = substituteSource {
      src = fetchgit {
        name = "rtabmap-source";
        url = "https://github.com/ros2-gbp/rtabmap-release.git";
        rev = "b00d3a40b7287a905845ea33a70f1a97f4ceda2a";
        hash = "sha256-Luz3Qpesd9XiQ+AnBO8zd30odiZ59mjdhxMeRbrIueU=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
})
