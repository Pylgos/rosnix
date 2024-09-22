{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  rt_manipulators_cpp,
  substituteSource,
}:
let
  sources = rec {
    rt_manipulators_examples = substituteSource {
      src = fetchFromGitHub {
        name = "rt_manipulators_examples-source";
        owner = "ros2-gbp";
        repo = "rt_manipulators_cpp-release";
        rev = "29b61b471b07224641d91c3b738f6a6985648c12";
        hash = "sha256-cNJsXqsJXtFAM3wNOEyNmybk38Hofq8NrTcUVuOA2HE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rt_manipulators_examples";
  version = "1.1.0-1";
  src = sources.rt_manipulators_examples;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rt_manipulators_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Examples for RT Manipulators C++ Library";
  };
}
