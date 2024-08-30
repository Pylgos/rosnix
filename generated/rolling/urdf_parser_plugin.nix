{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdfdom_headers,
}:
let
  sources = rec {
    urdf_parser_plugin = substituteSource {
      src = fetchgit {
        name = "urdf_parser_plugin-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "dad41adcdb0eb1dabc8a2ff43909f5107bc3e37e";
        hash = "sha256-jak4nCNAsPorAcfxqx1lqsktcFckTz78KrgpZ0ZN9ss=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_parser_plugin";
  version = "2.12.0-1";
  src = sources.urdf_parser_plugin;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "This package contains a C++ base class for URDF parsers.";
  };
}
