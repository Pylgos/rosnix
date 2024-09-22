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
    canopen_interfaces = substituteSource {
      src = fetchgit {
        name = "canopen_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "babcc793df4cd98b33de0306400c9324ca1b759d";
        hash = "sha256-40PHfYMqk3Vf1R9VBdJWyTB4pXYbDxHqyNb6PQbe+BY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_interfaces";
  version = "0.2.12-2";
  src = sources.canopen_interfaces;
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
