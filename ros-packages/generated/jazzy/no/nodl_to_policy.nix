{
  ament_copyright,
  ament_flake8,
  ament_lint_auto,
  ament_mypy,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "nodl_to_policy" = substituteSource {
      src = fetchgit {
        name = "nodl_to_policy-source";
        url = "https://github.com/ros2-gbp/nodl_to_policy-release.git";
        rev = "5cca667b9fbde1e0dfb2a9eca25035e45727fb29";
        hash = "sha256-e3+aKkyGXpBFCwulLKU8Tv8PSYEtqUTsp6iL1bE5W9g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nodl_to_policy";
  version = "1.0.0-5";
  src = sources."nodl_to_policy";
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
