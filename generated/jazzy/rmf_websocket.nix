{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  nlohmann_json_schema_validator_vendor,
  python3Packages,
  rclcpp,
  rmf_utils,
  substituteSource,
  websocketpp,
}:
let
  sources = rec {
    rmf_websocket = substituteSource {
      src = fetchgit {
        name = "rmf_websocket-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "cca3b39018221e53345b0f5755d9c021a86b164b";
        hash = "sha256-MUiwzL+DeP2+MZAfptPIqDcEKmUp4+aD605v14HBrVs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_websocket";
  version = "2.7.2-1";
  src = sources.rmf_websocket;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json nlohmann_json_schema_validator_vendor python3Packages.boost rclcpp rmf_utils websocketpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "A package managing the websocket api endpoints in RMF system.";
  };
}
