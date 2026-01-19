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
  version = "3.0.0-2";
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
        rev = "f79152134cd814950fff7475c50a1d9f42abd933";
        hash = "sha256-d7wFKcCuqNoJRC/XfTvhpaK792UZR/GrDv9rkDZOa/w=";
      };
    };
  });
  meta = {
    description = "Nodes and components for safe and efficient manipulation with topics";
  };
})
