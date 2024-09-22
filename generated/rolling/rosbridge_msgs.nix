{
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
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
    rosbridge_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "rosbridge_msgs-source";
        owner = "ros2-gbp";
        repo = "rosbridge_suite-release";
        rev = "a5f95853c53c54e0d861cff5676376a3adbc082e";
        hash = "sha256-gef94q+tOtKcYirePzrQpnNRqyw/TxlebG49vn/OYXI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_msgs";
  version = "1.3.2-2";
  src = sources.rosbridge_msgs;
  nativeBuildInputs = [ ament_cmake_ros rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing message files";
  };
}
