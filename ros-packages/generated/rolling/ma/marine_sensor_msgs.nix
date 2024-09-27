{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marine_sensor_msgs-6f590f0215eed16a5322ee9086dcabf6e555f00f = substituteSource {
      src = fetchgit {
        name = "marine_sensor_msgs-6f590f0215eed16a5322ee9086dcabf6e555f00f-source";
        url = "https://github.com/ros2-gbp/marine_msgs-release.git";
        rev = "6f590f0215eed16a5322ee9086dcabf6e555f00f";
        hash = "sha256-D0FezQ0OVWOXoPzNWC1TM9TGTcHR8hhUTXBz6uEQBnw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marine_sensor_msgs";
  version = "2.1.0-1";
  src = sources.marine_sensor_msgs-6f590f0215eed16a5322ee9086dcabf6e555f00f;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The marine_sensor_msgs package, meant to contain messages for common underwater sensors (e.g., conductivity, turbidity, dissolved oxygen)";
  };
}
