{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."rosx_introspection";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp rosbag2-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "rapidjson-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rclcpp rosbag2-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rapidjson-dev" ]; };
  checkInputs = [ geometry-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosx_introspection" = substituteSource {
      src = fetchgit {
        name = "rosx_introspection-source";
        url = "https://github.com/ros2-gbp/rosx_introspection-release.git";
        rev = "2630a7c6ada3592d75ef412a6c8992595353ea43";
        hash = "sha256-rqdbay5qd5AsvqzLTGUtkiYPDZ7bx4UvurwGmk8f9yY=";
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
    description = "Parse any ROS/ROS2 message without compile-time information";
  };
})
