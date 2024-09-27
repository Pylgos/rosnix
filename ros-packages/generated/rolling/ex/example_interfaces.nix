{
  ament_cmake,
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
    example_interfaces-368ac34d464d3bf9a41f0ba57b4e620015ee41fe = substituteSource {
      src = fetchgit {
        name = "example_interfaces-368ac34d464d3bf9a41f0ba57b4e620015ee41fe-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "368ac34d464d3bf9a41f0ba57b4e620015ee41fe";
        hash = "sha256-ml5g868RTSdeF+Sf56Ed0C3LWMU+G7I+cnQY3Jc83Bc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "example_interfaces";
  version = "0.13.0-1";
  src = sources.example_interfaces-368ac34d464d3bf9a41f0ba57b4e620015ee41fe;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains message and service definitions used by the examples.";
  };
}
