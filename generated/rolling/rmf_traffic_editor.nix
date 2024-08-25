{
  ament_cmake,
  ament_cmake_uncrustify,
  ament_index_cpp,
  buildRosPackage,
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  glog,
  libyamlcpp,
  proj,
  qt5,
  rmf_utils,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_traffic_editor = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "f78be64194865cd2eafe6ed22c85b8fbc2308024";
        hash = "sha256-Cw7vbZ3M8Zk4LpwVD8XWk8zmEzEtvlE2Vo6KcRdnTbk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor";
  version = "1.10.0-1";
  src = sources.rmf_traffic_editor;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp ceres-solver eigen glog libyamlcpp proj qt5.qtbase rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_uncrustify rmf_utils ];
  missingDependencies = [  ];
  meta = {
    description = "traffic editor";
  };
}
