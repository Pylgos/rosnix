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
        rev = "4abc4e5de80f7e4dcb16bc59483edc78756191f6";
        hash = "sha256-gef94q+tOtKcYirePzrQpnNRqyw/TxlebG49vn/OYXI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_msgs";
  version = "1.3.2-3";
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
