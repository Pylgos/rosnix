{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  resource-retriever,
  ros-environment,
  rosSystemPackages,
  rosgraph-msgs,
  rosx-introspection,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foxglove_bridge";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."foxglove_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-components resource-retriever ros-environment rosgraph-msgs rosx-introspection sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-components resource-retriever ros-environment rosgraph-msgs rosx-introspection sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "libwebsocketpp-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "foxglove_bridge" = substituteSource {
      src = fetchgit {
        name = "foxglove_bridge-source";
        url = "https://github.com/ros2-gbp/foxglove_bridge-release.git";
        rev = "7c27d75d7722e6911a3ae833a5c24c45fcdd3fde";
        hash = "sha256-iXRIOjhAKm9GIkwSoD2g94b10698ytfO9nkTGcg3slQ=";
      };
    };
  });
  meta = {
    description = "ROS Foxglove Bridge";
  };
})
