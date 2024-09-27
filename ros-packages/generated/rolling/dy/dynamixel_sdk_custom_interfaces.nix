{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "dynamixel_sdk_custom_interfaces" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_custom_interfaces-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "ab4bda85874e8339d298b128d2c9b4632106870a";
        hash = "sha256-pWGzlnONW1lXGAui57EHtKsqI3VguxYMeL+ytq6dgec=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dynamixel_sdk_custom_interfaces";
  version = "3.7.40-5";
  src = sources."dynamixel_sdk_custom_interfaces";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 custom interface examples using ROBOTIS DYNAMIXEL SDK";
  };
}
