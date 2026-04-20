{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2-medkit-cmake,
  ros2-medkit-gateway,
  ros2-medkit-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_graph_provider";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_graph_provider";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs rclcpp ros2-medkit-gateway ros2-medkit-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp ros2-medkit-gateway ros2-medkit-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_graph_provider" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_graph_provider-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "45dff50f92d7a08bba9018d62220c134fc77a327";
        hash = "sha256-nEH8yN7xPuSmTEe1ElJUEfTGqykyXqjvkcqD9whYQhQ=";
      };
    };
  });
  meta = {
    description = "Graph provider plugin for ros2_medkit gateway";
  };
})
