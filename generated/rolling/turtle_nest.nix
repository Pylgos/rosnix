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
        rev = "b4badf9aa67500cb14ccc17bbb7bcb5c9b4745c8";
        hash = "sha256-Wq8Lhnc71PLKrKuPq3/WMQWoS1F+lI67RvvVfx5xmRs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtle_nest";
  version = "1.0.1-1";
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
