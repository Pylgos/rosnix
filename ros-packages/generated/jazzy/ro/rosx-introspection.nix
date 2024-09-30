{
  ament-cmake,
  ament-index-cpp,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "rosx_introspection" = substituteSource {
      src = fetchgit {
        name = "rosx_introspection-source";
        url = "https://github.com/ros2-gbp/rosx_introspection-release.git";
        rev = "02a0c9e70eb60d10f9590739864b061f6d6ad667";
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
  pname = "rosx-introspection";
  version = "1.0.2-1";
  src = sources."rosx_introspection";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp fastcdr rclcpp rosbag2-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rapidjson-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ geometry-msgs sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Successor of ros_type_introspection";
  };
}