{
  ament_copyright,
  ament_flake8,
  ament_lint_auto,
  ament_mypy,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  nodl_python,
  ros2cli,
  ros2nodl,
  ros2run,
  rosSystemPackages,
  ros_testing,
  sros2,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    nodl_to_policy = substituteSource {
      src = fetchFromGitHub {
        name = "nodl_to_policy-source";
        owner = "ros2-gbp";
        repo = "nodl_to_policy-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nodl_python ros2cli ros2nodl ros2run sros2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_lint_auto ament_mypy ament_pep257 ament_pycodestyle ros_testing test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  meta = {
    description = "Package to generate a ROS 2 Access Control Policy from the NoDL description of a ROS system";
  };
}
