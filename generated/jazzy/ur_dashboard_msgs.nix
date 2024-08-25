{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    ur_dashboard_msgs = substituteSource {
      src = fetchgit {
        name = "ur_dashboard_msgs-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "cee65d463eeec4e134c5318c530242c71b827921";
        hash = "sha256-BfyBDlX9r+jLy0eXI6Fnj7q+dcN/BjA6zGtZJY1eMzE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_dashboard_msgs";
  version = "2.4.9-1";
  src = sources.ur_dashboard_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Messages around the UR Dashboard server.";
  };
}
