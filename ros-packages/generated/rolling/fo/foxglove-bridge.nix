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
  version = "0.8.0-1";
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
        rev = "74c97342e76388a9ac8340ce319e4f2800c9e717";
        hash = "sha256-55+rvWwEo3BQQ39q4jHC7MXaagY3vheCEPc3TnNeZZ0=";
      };
    };
  });
  meta = {
    description = "ROS Foxglove Bridge";
  };
})
