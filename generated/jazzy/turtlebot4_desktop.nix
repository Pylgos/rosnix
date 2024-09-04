{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot4_viz,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_desktop = substituteSource {
      src = fetchgit {
        name = "turtlebot4_desktop-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "a46b22f437c4fff85a6b9dd005c40f5d8eba5858";
        hash = "sha256-YoJZz2faJtiu1RZRR0PX7Zu8Yq2LEtHC+AWWRRB3yL0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_desktop";
  version = "2.0.0-1";
  src = sources.turtlebot4_desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot4_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Turtlebot4 Desktop Metapackage";
  };
}
