{
  ament_cmake,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    slider_publisher = substituteSource {
      src = fetchgit {
        name = "slider_publisher-source";
        url = "https://github.com/ros2-gbp/slider_publisher-release.git";
        rev = "8987416044584eb2e10d013016a80b431a5f0265";
        hash = "sha256-t3ye55W5XqkQUd/eAabhQKJUazIAi3ly0BsO7vpuHu4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "slider_publisher";
  version = "2.3.1-3";
  src = sources.slider_publisher;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.scipy rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
}
