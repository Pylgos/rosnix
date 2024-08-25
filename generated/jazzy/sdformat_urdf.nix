{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rcutils,
  sdformat_test_files,
  sdformat_vendor,
  substituteSource,
  tinyxml2_vendor,
  urdf,
  urdf_parser_plugin,
  urdfdom-headers,
}:
let
  sources = rec {
    sdformat_urdf = substituteSource {
      src = fetchgit {
        name = "sdformat_urdf-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "d923456c7a3c40a1cf8b8c32e52f9838c95ddfde";
        hash = "sha256-QJfr03O+ead4T8Bj6BazQbRKJsmW3J6I9g1XWtun6Us=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_urdf";
  version = "1.0.2-1";
  src = sources.sdformat_urdf;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rcutils sdformat_vendor tinyxml2_vendor urdf urdf_parser_plugin urdfdom-headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common sdformat_test_files ];
  missingDependencies = [  ];
  meta = {
    description = "URDF plugin to parse SDFormat XML into URDF C++ DOM objects.";
  };
}
