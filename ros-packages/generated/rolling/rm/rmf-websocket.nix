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
  version = "2.7.1-1";
  src = finalAttrs.passthru.sources."rmf_websocket";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nlohmann-json-schema-validator-vendor rclcpp rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libwebsocketpp-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_websocket" = substituteSource {
      src = fetchgit {
        name = "rmf_websocket-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "8471b200555cffa3b38720294c78fed379cd1412";
        hash = "sha256-QjcXatjvB2NeZj4Y24OY3ZWxdCEkjPsx4IjIWiHa7LQ=";
      };
    };
  });
  meta = {
    description = "A package managing the websocket api endpoints in RMF system.";
  };
})
