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
        rev = "419c6c4e63e3ba0c02e388532e9ba917298f5c29";
        hash = "sha256-jmjbEvN8s1LAK5SSF/CO7sPs15jtjJRxJqFPrTWhMFQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_parser_plugin";
  version = "2.11.0-1";
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
