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
        rev = "77d0c5db6fc502b0d44926e2a852b8149eebe704";
        hash = "sha256-4Sz8x27mOS78Aif3y3nIoUnZ7MZNlGI2m1qqluPKoG8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "builtin_interfaces";
  version = "2.0.2-2";
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
