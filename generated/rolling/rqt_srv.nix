{
  ament_flake8,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rqt_gui,
  rqt_gui_py,
  rqt_msg,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_srv = substituteSource {
      src = fetchgit {
        name = "rqt_srv-source";
        url = "https://github.com/ros2-gbp/rqt_srv-release.git";
        rev = "8bc139677527cc18250f52699b8f545105d22b58";
        hash = "sha256-g2273HGG1SAs9s3imB+LXJZde80qFz583t6NdQOdQxM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_srv";
  version = "1.3.0-1";
  src = sources.rqt_srv;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_py rqt_msg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A Python GUI plugin for introspecting available ROS service types.";
  };
}
