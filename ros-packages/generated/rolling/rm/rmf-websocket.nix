{
  ament-cmake,
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nlohmann-json-schema-validator-vendor,
  rclcpp,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_websocket" = substituteSource {
      src = fetchgit {
        name = "rmf_websocket-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "8471b200555cffa3b38720294c78fed379cd1412";
        hash = "sha256-QjcXatjvB2NeZj4Y24OY3ZWxdCEkjPsx4IjIWiHa7LQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_websocket";
  version = "2.7.1-1";
  src = sources."rmf_websocket";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nlohmann-json-schema-validator-vendor rclcpp rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libwebsocketpp-dev" "nlohmann-json-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package managing the websocket api endpoints in RMF system.";
  };
}
