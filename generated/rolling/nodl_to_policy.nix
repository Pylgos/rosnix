{
  ament_copyright,
  ament_flake8,
  ament_lint_auto,
  ament_mypy,
  ament_pep257,
  ament_pycodestyle,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nodl_python,
  python3Packages,
  ros2cli,
  ros2nodl,
  ros2run,
  ros_testing,
  sros2,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    nodl_to_policy = substituteSource {
      src = fetchgit {
        name = "nodl_to_policy-source";
        url = "https://github.com/ros2-gbp/nodl_to_policy-release.git";
        rev = "c36cf6636fb76d8d170a8afbb8f182db45fd351d";
        hash = "sha256-e3+aKkyGXpBFCwulLKU8Tv8PSYEtqUTsp6iL1bE5W9g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nodl_to_policy";
  version = "1.0.0-4";
  src = sources.nodl_to_policy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nodl_python python3Packages.lxml ros2cli ros2nodl ros2run sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_lint_auto ament_mypy ament_pep257 ament_pycodestyle python3Packages.pytest python3Packages.pytest-mock ros_testing test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Package to generate a ROS 2 Access Control Policy from the NoDL description of a ROS system";
  };
}
