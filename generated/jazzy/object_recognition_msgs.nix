{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    object_recognition_msgs = substituteSource {
      src = fetchgit {
        name = "object_recognition_msgs-source";
        url = "https://github.com/ros2-gbp/object_recognition_msgs-release.git";
        rev = "413107d99caa9d8d477112ce00967a5e87913a2f";
        hash = "sha256-51GLrMSSWkdlTz5SBW9ImQilU5Rojo8emRiwZZtZtS0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "object_recognition_msgs";
  version = "2.0.0-5";
  src = sources.object_recognition_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs rosidl_default_runtime sensor_msgs shape_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Object_recognition_msgs contains the ROS message and the actionlib definition used in object_recognition_core";
  };
}
