{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  resource-retriever,
  ros-environment,
  rosSystemPackages,
  rosgraph-msgs,
  rosx-introspection,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foxglove_bridge";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."foxglove_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp rclcpp-components resource-retriever ros-environment rosgraph-msgs rosx-introspection ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rclcpp rclcpp-components resource-retriever ros-environment rosgraph-msgs rosx-introspection ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "libwebsocketpp-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "foxglove_bridge" = substituteSource {
      src = fetchgit {
        name = "foxglove_bridge-source";
        url = "https://github.com/ros2-gbp/foxglove_bridge-release.git";
        rev = "9b79c7df5b1f076c7ad4007c64498875ad7f5763";
        hash = "sha256-Cz3cOEcWtTBQD6rf8/SX3x9Q+n/JY9xq3b8oAOztUQI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \${FOXGLOVE_SDK_URL}";
          to = "URL ${sources."foxglove_bridge/foxglove-v0"}";
        }
      ];
    };
    "foxglove_bridge/foxglove-v0" = substituteSource {
      src = fetchzip {
        name = "foxglove-v0-source";
        url = "https://github.com/foxglove/foxglove-sdk/releases/download/sdk%2Fv0.14.2/foxglove-v0.14.2-cpp-x86_64-unknown-linux-gnu.zip";
        hash = "sha256-XRvnaC7SQ507g1GZTXW+7WqnDLfVIzqXQhxwi4vUzzs=";
      };
    };
  });
  meta = {
    description = "ROS Foxglove Bridge";
  };
})
