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
        rev = "a7a80ef621442c6ebff6bd182d225e8815a97469";
        hash = "sha256-n5Nrn5TAPvuzJhNsos1w943T3HDWOoaoUuJbyyg1T18=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_urdf";
  version = "2.0.1-1";
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
