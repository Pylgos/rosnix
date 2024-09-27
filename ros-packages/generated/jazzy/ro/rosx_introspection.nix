{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosSystemPackages,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    CPM-vendor_source-0aksw7q86ydywmfswnd1b7n86b758hwwjl38hxn65i3nb4x4ydbv = substituteSource {
      src = fetchurl {
        name = "CPM-vendor_source-0aksw7q86ydywmfswnd1b7n86b758hwwjl38hxn65i3nb4x4ydbv-source";
        url = "https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.40.0/CPM.cmake";
        hash = "sha256-ezVPOll2xGJsh2hQyTlE5SyD7FmhWa5d5b55g/Dheio=";
      };
      substitutions = [
      ];
    };
    rosx_introspection-02a0c9e70eb60d10f9590739864b061f6d6ad667 = substituteSource {
      src = fetchgit {
        name = "rosx_introspection-02a0c9e70eb60d10f9590739864b061f6d6ad667-source";
        url = "https://github.com/ros2-gbp/rosx_introspection-release.git";
        rev = "02a0c9e70eb60d10f9590739864b061f6d6ad667";
        hash = "sha256-PxUiV3BPyRmYvvYjQmfa7BTP7kFxgfyXAC44akRvT08=";
      };
      substitutions = [
        {
          path = "cmake/CPM.cmake";
          from = "DOWNLOAD\n     https://github.com/cpm-cmake/CPM.cmake/releases/download/v\${CPM_DOWNLOAD_VERSION}/CPM.cmake";
          to = "DOWNLOAD file://${CPM-vendor_source-0aksw7q86ydywmfswnd1b7n86b758hwwjl38hxn65i3nb4x4ydbv}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "rosx_introspection";
  version = "1.0.2-1";
  src = sources.rosx_introspection-02a0c9e70eb60d10f9590739864b061f6d6ad667;
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
