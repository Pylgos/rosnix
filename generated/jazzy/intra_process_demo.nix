{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  rclcpp,
  rmw_implementation_cmake,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    intra_process_demo = substituteSource {
      src = fetchgit {
        name = "intra_process_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "18ef1bbb1f02523801ab16ebc13d7ef70aeb3af7";
        hash = "sha256-8TQGR7Z0aSoPVWDis0s0khmkUkE/OTX4xVJor8Mumkk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "intra_process_demo";
  version = "0.33.5-1";
  src = sources.intra_process_demo;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake rmw_implementation_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Demonstrations of intra process communication.";
  };
}
