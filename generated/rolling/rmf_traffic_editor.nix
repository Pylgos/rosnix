{
  ament_cmake,
  ament_cmake_uncrustify,
  ament_index_cpp,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_utils,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_traffic_editor = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_traffic_editor-source";
        owner = "ros2-gbp";
        repo = "rmf_traffic_editor-release";
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
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" "libgoogle-glog-dev" "libqt5-concurrent" "libqt5-widgets" "proj" "qtbase5-dev" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_uncrustify rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "traffic editor";
  };
}
