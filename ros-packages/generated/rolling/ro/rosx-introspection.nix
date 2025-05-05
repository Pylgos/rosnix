{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosx_introspection";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."rosx_introspection";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp fastcdr rclcpp rosbag2-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "rapidjson-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp fastcdr rclcpp rosbag2-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rapidjson-dev" ]; };
  checkInputs = [ geometry-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosx_introspection" = substituteSource {
      src = fetchgit {
        name = "rosx_introspection-source";
        url = "https://github.com/ros2-gbp/rosx_introspection-release.git";
        rev = "fff7bdfa85870357de451d78417f9502ac96f413";
        hash = "sha256-PxUiV3BPyRmYvvYjQmfa7BTP7kFxgfyXAC44akRvT08=";
      };
      substitutions = [
        {
          path = "cmake/CPM.cmake";
          from = "DOWNLOAD\n     https://github.com/cpm-cmake/CPM.cmake/releases/download/v\${CPM_DOWNLOAD_VERSION}/CPM.cmake";
          to = "DOWNLOAD file://${sources."rosx_introspection/CPM"}";
        }
      ];
    };
    "rosx_introspection/CPM" = substituteSource {
      src = fetchurl {
        name = "CPM-source";
        url = "https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.40.0/CPM.cmake";
        hash = "sha256-ezVPOll2xGJsh2hQyTlE5SyD7FmhWa5d5b55g/Dheio=";
      };
    };
  });
  meta = {
    description = "Successor of ros_type_introspection";
  };
})
