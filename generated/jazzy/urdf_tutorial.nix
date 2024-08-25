{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdf_launch,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    urdf_tutorial = substituteSource {
      src = fetchgit {
        name = "urdf_tutorial-source";
        url = "https://github.com/ros2-gbp/urdf_tutorial-release.git";
        rev = "768fb035b41a3366d0bd4c5088643a7b8b411276";
        hash = "sha256-is2/qeO2wFsbEBxJ8Kf0u+3EkFtbejI8nZpazjXVziM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_tutorial";
  version = "1.1.0-3";
  src = sources.urdf_tutorial;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdf_launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "This package contains a number of URDF tutorials.";
  };
}
