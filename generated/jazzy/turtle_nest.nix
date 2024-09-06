{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtle_nest = substituteSource {
      src = fetchgit {
        name = "turtle_nest-source";
        url = "https://github.com/ros2-gbp/turtle_nest-release.git";
        rev = "c72ef68cf0a0269dbe9a93fc49b4d2bbd44ce78c";
        hash = "sha256-ZOCujpxbSs8G7iK430a6Q5AzSeAzQ5Dh2CfDIZ1XlAY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtle_nest";
  version = "1.0.2-1";
  src = sources.turtle_nest;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt5.qtbase ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS 2 Package Creator";
  };
}
