{
  ament_cmake,
  ament_cmake_core,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    generate_parameter_library_example = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "521a41bf987af9060c240d049986641cf34bd0a8";
        hash = "sha256-d0nHulgcdsijc/fqux0zSYWVUPWx2mS9mWEa+PpXhtM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "generate_parameter_library_example";
  version = "0.3.8-3";
  src = sources.generate_parameter_library_example;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate_parameter_library rclcpp rclcpp_components ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example usage of generate_parameter_library.";
  };
}
