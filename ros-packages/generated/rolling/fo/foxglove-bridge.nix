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
  version = "0.8.2-1";
  src = finalAttrs.passthru.sources."foxglove_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ ament-index-cpp rclcpp rclcpp-components resource-retriever rosgraph-msgs rosx-introspection ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libssl-dev" "libwebsocketpp-dev" "nlohmann-json-dev" "openssl" "zlib" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "foxglove_bridge" = substituteSource {
      src = fetchgit {
        name = "foxglove_bridge-source";
        url = "https://github.com/ros2-gbp/foxglove_bridge-release.git";
        rev = "baa2da751a8b93596039f4ca529f2581fa76b563";
        hash = "sha256-n8qBsFxUEeBGJwgM0QWdLQCjtvNZ3I8EvSquIHMea9o=";
      };
    };
  });
  meta = {
    description = "ROS Foxglove Bridge";
  };
})
