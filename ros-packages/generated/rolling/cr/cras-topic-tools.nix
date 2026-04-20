{
  ament-cmake,
  ament-cmake-gen-version-h,
  buildAmentCmakePackage,
  cras-cpp-common,
  cras-lint,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  topic-tools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cras_topic_tools";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."cras_topic_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ cras-cpp-common rclcpp rclcpp-components std-msgs topic-tools ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcxxopts-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ cras-cpp-common rclcpp rclcpp-components std-msgs topic-tools ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcxxopts-dev" ]; };
  checkInputs = [ cras-lint ];
  passthru.sources = mkSourceSet (sources: {
    "cras_topic_tools" = substituteSource {
      src = fetchgit {
        name = "cras_topic_tools-source";
        url = "https://github.com/ros2-gbp/cras_ros_utils-release.git";
        rev = "5253351f7fe90840ef18bea00e176e207432a5a6";
        hash = "sha256-VxwWtjn9ca8dfcRXoJ3+oWEf+/ws3+nnqrvT78GTJIA=";
      };
    };
  });
  meta = {
    description = "Nodes and components for safe and efficient manipulation with topics";
  };
})
