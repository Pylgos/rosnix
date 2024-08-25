{
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  libg2o,
  libpointmatcher,
  pcl,
  proj,
  qt_gui_cpp,
  sqlite,
  substituteSource,
  tbb,
  wrapRosQtAppsHook,
  zlib,
}:
let
  sources = rec {
    rtabmap = substituteSource {
      src = fetchgit {
        name = "rtabmap-source";
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
  src = sources.rtabmap;
  nativeBuildInputs = [ cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge gtsam libg2o libpointmatcher pcl proj qt_gui_cpp sqlite tbb zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" ];
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
}
