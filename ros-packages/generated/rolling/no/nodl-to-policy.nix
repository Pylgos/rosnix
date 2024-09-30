{
  ament-copyright,
  ament-flake8,
  ament-lint-auto,
  ament-mypy,
  ament-pep257,
  ament-pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nodl-python,
  ros-testing,
  ros2cli,
  ros2nodl,
  ros2run,
  rosSystemPackages,
  sros2,
  substituteSource,
  test-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "nodl_to_policy" = substituteSource {
      src = fetchgit {
        name = "nodl_to_policy-source";
        url = "https://github.com/ros2-gbp/nodl_to_policy-release.git";
        rev = "c36cf6636fb76d8d170a8afbb8f182db45fd351d";
        hash = "sha256-e3+aKkyGXpBFCwulLKU8Tv8PSYEtqUTsp6iL1bE5W9g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nodl_to_policy";
  version = "1.0.0-4";
  src = sources."nodl_to_policy";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nodl-python ros2cli ros2nodl ros2run sros2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-lint-auto ament-mypy ament-pep257 ament-pycodestyle ros-testing test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  meta = {
    description = "Package to generate a ROS 2 Access Control Policy from the NoDL description of a ROS system";
  };
}
