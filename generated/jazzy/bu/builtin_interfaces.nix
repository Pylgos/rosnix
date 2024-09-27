{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_core_generators,
  rosidl_core_runtime,
  substituteSource,
}:
let
  sources = rec {
    builtin_interfaces-77d0c5db6fc502b0d44926e2a852b8149eebe704 = substituteSource {
      src = fetchgit {
        name = "builtin_interfaces-77d0c5db6fc502b0d44926e2a852b8149eebe704-source";
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
  src = sources.builtin_interfaces-77d0c5db6fc502b0d44926e2a852b8149eebe704;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_core_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing message and service definitions for types defined in the OMG IDL Platform Specific Model.";
  };
}
