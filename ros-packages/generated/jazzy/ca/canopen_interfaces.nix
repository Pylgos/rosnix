{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    canopen_interfaces-45c79d4c66a246d9b5b6f71e9c79865e1be15b27 = substituteSource {
      src = fetchgit {
        name = "canopen_interfaces-45c79d4c66a246d9b5b6f71e9c79865e1be15b27-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "45c79d4c66a246d9b5b6f71e9c79865e1be15b27";
        hash = "sha256-b4Art6VZ5FZEibqz5dLOW4lYb2loGS/4m9HV9+jWrS4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_interfaces";
  version = "0.2.9-2";
  src = sources.canopen_interfaces-45c79d4c66a246d9b5b6f71e9c79865e1be15b27;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Services and Messages for ros2_canopen stack";
  };
}
