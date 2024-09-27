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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    swri_cli_tools-aab3aa68ad2eb94c4c1cbb831637c5b0d09aa704 = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-aab3aa68ad2eb94c4c1cbb831637c5b0d09aa704-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "aab3aa68ad2eb94c4c1cbb831637c5b0d09aa704";
        hash = "sha256-+KMCtFe8+XjU+SFjS+H4Jmexp8YCW+t4IBLP3dQT10Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_cli_tools";
  version = "3.7.3-1";
  src = sources.swri_cli_tools-aab3aa68ad2eb94c4c1cbb831637c5b0d09aa704;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ marti_introspection_msgs rcl_interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-natsort" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
}
