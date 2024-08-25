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
  substituteSource,
}:
let
  sources = rec {
    swri_cli_tools = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "a0e5e084aba56079a5ede4e19907b9ad8ac34ad6";
        hash = "sha256-QwxRWoZHoEeWtgjiih1KGtL4z0gAytUMI9yLK2eIJ6Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_cli_tools";
  version = "3.6.1-3";
  src = sources.swri_cli_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ marti_introspection_msgs rcl_interfaces rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ];
  missingDependencies = [ "python3-natsort" ];
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
}
