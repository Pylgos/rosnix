{
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rosapi_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "rosapi_msgs-source";
        owner = "ros2-gbp";
        repo = "rosbridge_suite-release";
        rev = "697cc305441c19d030d17c756d093c4d11af6195";
        hash = "sha256-mS6s9obrtPJQkYEJluig+KM2GqAKwG2QSBz9iGCJMtc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosapi_msgs";
  version = "1.3.2-3";
  src = sources.rosapi_msgs;
  nativeBuildInputs = [ ament_cmake_ros rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rcl_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides service calls for getting ros meta-information, like list of topics, services, params, etc.";
  };
}
