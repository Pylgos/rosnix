{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_mypy,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  ros2cli,
  rosSystemPackages,
  ros_testing,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    sros2 = substituteSource {
      src = fetchgit {
        name = "sros2-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "3a92a9b9cc2f7dcf45cb81837d02f4bd4b1025d5";
        hash = "sha256-AFBegFKnVMDaE0Y8vtfiJv+gfqwvz088nnAIG4U5u50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2";
  version = "0.13.2-1";
  src = sources.sros2;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-resources" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python rclpy ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cryptography" "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_mypy ament_pep257 ros_testing test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Command line tools for managing SROS2 keys";
  };
}
