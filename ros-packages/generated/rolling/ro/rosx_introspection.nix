{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
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
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosx_introspection";
  version = "1.0.2-1";
  src = sources."rosx_introspection";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp fastcdr rclcpp rosbag2_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rapidjson-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ geometry_msgs sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Successor of ros_type_introspection";
  };
}
