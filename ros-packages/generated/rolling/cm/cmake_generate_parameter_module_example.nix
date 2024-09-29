{
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "cmake_generate_parameter_module_example" = substituteSource {
      src = fetchgit {
        name = "cmake_generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "9fd41b460ee9bbb3e861e0b8199a8e6fc3639832";
        hash = "sha256-fv1GUmHiJR1Zj2CI0CdtNFcUIVXuykeEmbSN9ib0fRw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "cmake_generate_parameter_module_example";
  version = "0.3.8-3";
  src = sources."cmake_generate_parameter_module_example";
  nativeBuildInputs = [ ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate_parameter_library rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example usage of generate_parameter_library for a python module with cmake.";
  };
}