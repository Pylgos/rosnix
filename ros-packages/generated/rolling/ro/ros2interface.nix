{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  mkSourceSet,
  ros2cli,
  ros2cli_test_interfaces,
  rosSystemPackages,
  rosidl_adapter,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "ros2interface" = substituteSource {
      src = fetchgit {
        name = "ros2interface-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "b8319e4b3dd8275880f1a74b2b933b7c5783d6a1";
        hash = "sha256-FUMbEzGQ11o31eAjj07WHAX1QPfrSL0q+5yBscImv08=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros2interface";
  version = "0.34.1-1";
  src = sources."ros2interface";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_adapter ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python ros2cli rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_testing launch_testing_ros ros2cli_test_interfaces test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "The interface command for ROS 2 command line tools";
  };
}
