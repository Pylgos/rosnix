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
  version = "3.2.3-1";
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
        rev = "5f51c37faeaa80320b6422d5428c154ed7f77411";
        hash = "sha256-s4/EtpxGi+bNxwBMzY4mbTseQhBdZhmDTexOpBuF7hI=";
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
        url = "https://github.com/foxglove/foxglove-sdk/releases/download/sdk%2Fv0.15.2/foxglove-v0.15.2-cpp-x86_64-unknown-linux-gnu.zip";
        hash = "sha256-bL1/CTNLm8RUUX5hCKXe5DYGe13FPdGg0G9X4OphKlc=";
      };
    };
  });
  meta = {
    description = "ROS Foxglove Bridge";
  };
})
