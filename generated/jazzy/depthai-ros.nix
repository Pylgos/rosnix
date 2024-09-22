{
  ament_cmake,
  buildRosPackage,
  depthai,
  depthai_bridge,
  depthai_descriptions,
  depthai_examples,
  depthai_filters,
  depthai_ros_driver,
  depthai_ros_msgs,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    depthai-ros = substituteSource {
      src = fetchFromGitHub {
        name = "depthai-ros-source";
        owner = "luxonis";
        repo = "depthai-ros-release";
        rev = "c80994e114a0b162c772b0ad499f9dc6982671ee";
        hash = "sha256-B6qtuwBU7eT1655vpi6jexRP2pENsxhmN/5FGuXRsyg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai-ros";
  version = "2.10.0-1";
  src = sources.depthai-ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ depthai depthai_bridge depthai_descriptions depthai_examples depthai_filters depthai_ros_driver depthai_ros_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The depthai-ros package";
  };
}
