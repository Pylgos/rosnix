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
        rev = "a139307d763dc09a9e001d93d3ba014726cbbc9f";
        hash = "sha256-sb6x9v14bi5IE3lj47VcC0k7Asl/8ue55fXQ7xMqvDk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_srv";
  version = "1.2.2-3";
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
