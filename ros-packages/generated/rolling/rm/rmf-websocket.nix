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
  version = "2.10.1-1";
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
        rev = "21f0e9a1e8b7728ccbcaaf24b8a3885df9b8769e";
        hash = "sha256-VFgJTSYP3lY4qnhSddd6Y9j93CLNR9bb2Q68WCa4KEk=";
      };
    };
  });
  meta = {
    description = "A package managing the websocket api endpoints in RMF system.";
  };
})
