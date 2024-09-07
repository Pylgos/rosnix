{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_introspection_msgs,
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  ros2topic,
  substituteSource,
}:
let
  sources = rec {
    swri_cli_tools = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "9329d66a9387c92c72ef3c2525c1c31fe0dff0eb";
        hash = "sha256-t2Px8l4Pk0x+7igUKRlkW1cp0HmOARg5FK84ZGhcoNs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_cli_tools";
  version = "3.7.1-1";
  src = sources.swri_cli_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ marti_introspection_msgs rcl_interfaces rclpy ros2cli ros2node ros2param ros2topic ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ];
  missingDependencies = [ "python3-natsort" ];
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
}
