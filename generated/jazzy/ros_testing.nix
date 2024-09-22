{
  ament_cmake,
  ament_cmake_core,
  ament_cmake_export_dependencies,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  ros2test,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ros_testing = substituteSource {
      src = fetchgit {
        name = "ros_testing-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "698ef5baf793b32a4d4e3ffcce820c13902e4ef1";
        hash = "sha256-fs+oXGxdtoXxQxvZSsImWJtNFp+X3jdTHN31wD+47Yg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_testing";
  version = "0.6.0-3";
  src = sources.ros_testing;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies launch_testing_ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch_testing launch_testing_ros ros2test ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The entry point package to launch testing in ROS.";
  };
}
