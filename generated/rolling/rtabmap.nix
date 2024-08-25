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
  qt5,
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
        rev = "2b006d498b6df04f4dcddf01fe1d9d90e94570e8";
        hash = "sha256-dg5NbiIJYYT3CPzwPwMVxK1ag4M310PlkRCB5iNkHHs=";
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
  propagatedBuildInputs = [ cv_bridge gtsam libg2o libpointmatcher pcl proj qt5.qtbase sqlite tbb zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" ];
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
}
