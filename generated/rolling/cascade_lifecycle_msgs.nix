{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    cascade_lifecycle_msgs = substituteSource {
      src = fetchgit {
        name = "cascade_lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "7ad0edb701febd76972bf734e2a8c57c66391308";
        hash = "sha256-vr1h9TdjCkXvrxYIYrmyyXpL/IO9M0hByXfdsHA2FO4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cascade_lifecycle_msgs";
  version = "2.0.0-1";
  src = sources.cascade_lifecycle_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Messages for rclcpp_cascade_lifecycle package";
  };
}
