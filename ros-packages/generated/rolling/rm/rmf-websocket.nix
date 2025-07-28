{
  ament-cmake,
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_websocket";
  version = "2.11.1-1";
  src = finalAttrs.passthru.sources."rmf_websocket";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nlohmann-json-schema-validator-vendor rclcpp rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libwebsocketpp-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nlohmann-json-schema-validator-vendor rclcpp rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libwebsocketpp-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_websocket" = substituteSource {
      src = fetchgit {
        name = "rmf_websocket-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "d2dd389c786abac5a905e865a15d98a4cd0acb67";
        hash = "sha256-Yc9vn/a7Bcv5il33GKaJ2y2sA6conwEQz0irFi1Z4hc=";
      };
    };
  });
  meta = {
    description = "A package managing the websocket api endpoints in RMF system.";
  };
})
