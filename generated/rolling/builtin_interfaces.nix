{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  substituteSource,
}:
let
  sources = rec {
    builtin_interfaces = substituteSource {
      src = fetchgit {
        name = "builtin_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "dc2e3169ea022057f2e85e3f33c98980483911eb";
        hash = "sha256-qcLKGVbZJHzSuOCcJCqOWtju1X2JcXHPDFgGShM1J7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "builtin_interfaces";
  version = "2.2.0-1";
  src = sources.builtin_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_core_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing message and service definitions for types defined in the OMG IDL Platform Specific Model.";
  };
}
