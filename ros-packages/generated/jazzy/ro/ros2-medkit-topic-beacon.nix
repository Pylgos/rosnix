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
  ros2-medkit-beacon-common,
  ros2-medkit-cmake,
  ros2-medkit-gateway,
  ros2-medkit-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_topic_beacon";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_topic_beacon";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs rclcpp ros2-medkit-beacon-common ros2-medkit-gateway ros2-medkit-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp ros2-medkit-beacon-common ros2-medkit-gateway ros2-medkit-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_topic_beacon" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_topic_beacon-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "cfd1b5f61e74580dbca0bc9377ed11c6d5070905";
        hash = "sha256-RRzX573YwZN8N6AAFvJVU8vQvHkzEq7ZGCZKpvcqlK8=";
      };
    };
  });
  meta = {
    description = "Topic-based beacon discovery plugin for ros2_medkit gateway";
  };
})
