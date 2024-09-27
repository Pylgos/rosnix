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
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    sick_safetyscanners2_interfaces-203d6756255f16dd22d8ac5a1012647710403ed2 = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners2_interfaces-203d6756255f16dd22d8ac5a1012647710403ed2-source";
        url = "https://github.com/ros2-gbp/sick_safetyscanners2_interfaces-release.git";
        rev = "203d6756255f16dd22d8ac5a1012647710403ed2";
        hash = "sha256-FFsjwMwXpIDUcZce2QdkhLAspn9kJgyNkvTQ8UhjUYQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safetyscanners2_interfaces";
  version = "1.0.0-1";
  src = sources.sick_safetyscanners2_interfaces-203d6756255f16dd22d8ac5a1012647710403ed2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interfaces for the sick_safetyscanners ros2 driver";
  };
}
