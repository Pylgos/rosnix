{
  ament_flake8,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  ament_mypy,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nodl_python,
  ros2cli,
  ros2pkg,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ros2nodl-79e166114dcef2812bc1d7bc0d91b798323565ea = substituteSource {
      src = fetchgit {
        name = "ros2nodl-79e166114dcef2812bc1d7bc0d91b798323565ea-source";
        url = "https://github.com/ros2-gbp/nodl-release.git";
        rev = "79e166114dcef2812bc1d7bc0d91b798323565ea";
        hash = "sha256-8JQgseO9AxfsDy2YuxQ/dojS/6MOLaCKwBGUX8hIgwk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2nodl";
  version = "0.3.1-5";
  src = sources.ros2nodl-79e166114dcef2812bc1d7bc0d91b798323565ea;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python nodl_python ros2cli ros2pkg ros2run ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_lint_auto ament_lint_common ament_mypy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  meta = {
    description = "CLI tools for NoDL files.";
  };
}
