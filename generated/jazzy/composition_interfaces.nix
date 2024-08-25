{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    composition_interfaces = substituteSource {
      src = fetchgit {
        name = "composition_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "7c7e9ce9c33e3d9920ce099ede290d836642e111";
        hash = "sha256-YTmCcgVPa5sosZzoRmcBvPGUebFIGOCK8SjI0aGXMRU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition_interfaces";
  version = "2.0.2-2";
  src = sources.composition_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing message and service definitions for managing composable nodes in a container process.";
  };
}
