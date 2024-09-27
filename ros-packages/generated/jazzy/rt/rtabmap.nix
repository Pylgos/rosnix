{
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  libg2o,
  libpointmatcher,
  qt_gui_cpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap-1c72d1b144d6c524ce0b66e3307e6c3c6fb188e0 = substituteSource {
      src = fetchgit {
        name = "rtabmap-1c72d1b144d6c524ce0b66e3307e6c3c6fb188e0-source";
        url = "https://github.com/ros2-gbp/rtabmap-release.git";
        rev = "1c72d1b144d6c524ce0b66e3307e6c3c6fb188e0";
        hash = "sha256-wF68y0YveuAPXq2DOgb4KGYuCN0GovrczL95nNpGLC0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap";
  version = "0.21.6-1";
  src = sources.rtabmap-1c72d1b144d6c524ce0b66e3307e6c3c6fb188e0;
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge gtsam libg2o libpointmatcher qt_gui_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libsqlite3-dev" "proj" "tbb" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
}
