{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosidl_default_generators,
  sensor_msgs,
  std_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    depthai_ros_msgs = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "c608aaa9aad5773506878fa49a01368d0f849fcb";
        hash = "sha256-0yQYKTWh/paomwZ8dRVP2+o1icHsm42PlX3SQCFDvok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_ros_msgs";
  version = "2.10.0-1";
  src = sources.depthai_ros_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp sensor_msgs std_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Package to keep interface independent of the driver";
  };
}
