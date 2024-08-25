{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    sensor_msgs = substituteSource {
      src = fetchgit {
        name = "sensor_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "25593c7bb356cae9badacb11b6598a0b1b639901";
        hash = "sha256-hszAgR55yQyD6P85LEtYsMVCaf4OpnWk0gS5G8tjEdk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sensor_msgs";
  version = "5.3.5-1";
  src = sources.sensor_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common rosidl_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some sensor data related message and service definitions.";
  };
}
