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
        rev = "cca3b39018221e53345b0f5755d9c021a86b164b";
        hash = "sha256-MUiwzL+DeP2+MZAfptPIqDcEKmUp4+aD605v14HBrVs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_websocket";
  version = "2.7.2-1";
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
