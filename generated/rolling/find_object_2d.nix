{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  message_filters,
  qt5,
  rclcpp,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
  zlib,
}:
let
  sources = rec {
    find_object_2d = substituteSource {
      src = fetchgit {
        name = "find_object_2d-source";
        url = "https://github.com/ros2-gbp/find_object_2d-release.git";
        rev = "04c9e7c8afdb14b1afe8aaa8b577ed8fe8b706c7";
        hash = "sha256-njkQr+O+9huFcwwGGOLQgumrN8K4RuGpTCjeMdVtuhA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "find_object_2d";
  version = "0.7.1-1";
  src = sources.find_object_2d;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces cv_bridge geometry_msgs image_transport message_filters qt5.qtbase rclcpp rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The find_object_2d package";
  };
}
