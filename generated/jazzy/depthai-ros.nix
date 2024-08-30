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
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    depthai-ros = substituteSource {
      src = fetchgit {
        name = "depthai-ros-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ depthai depthai_bridge depthai_descriptions depthai_examples depthai_filters depthai_ros_driver depthai_ros_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The depthai-ros package";
  };
}
