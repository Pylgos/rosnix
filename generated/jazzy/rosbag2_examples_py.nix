{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  rosbag2_py,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_py = substituteSource {
      src = fetchFromGitHub {
        name = "rosbag2_examples_py-source";
        owner = "ros2-gbp";
        repo = "rosbag2-release";
        rev = "abb1148658689d3084410fab326b3a7e9226e8aa";
        hash = "sha256-gbsmLKyygTEyDTCQ3LVP4wDvwEOhuHvsKzH+QYIgxE0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_py";
  version = "0.26.5-1";
  src = sources.rosbag2_examples_py;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclpy rosbag2_py std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python bag writing tutorial";
  };
}
