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
        rev = "8471b200555cffa3b38720294c78fed379cd1412";
        hash = "sha256-QjcXatjvB2NeZj4Y24OY3ZWxdCEkjPsx4IjIWiHa7LQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_websocket";
  version = "2.7.1-1";
  src = sources.rmf_websocket;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen nlohmann_json nlohmann_json_schema_validator_vendor python3Packages.boost rclcpp rmf_utils websocketpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "A package managing the websocket api endpoints in RMF system.";
  };
}
