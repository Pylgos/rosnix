{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    object_recognition_msgs-7485fba77d1b2a6cf783f0a288eb029a64b1d1a4 = substituteSource {
      src = fetchgit {
        name = "object_recognition_msgs-7485fba77d1b2a6cf783f0a288eb029a64b1d1a4-source";
        url = "https://github.com/ros2-gbp/object_recognition_msgs-release.git";
        rev = "7485fba77d1b2a6cf783f0a288eb029a64b1d1a4";
        hash = "sha256-51GLrMSSWkdlTz5SBW9ImQilU5Rojo8emRiwZZtZtS0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "object_recognition_msgs";
  version = "2.0.0-4";
  src = sources.object_recognition_msgs-7485fba77d1b2a6cf783f0a288eb029a64b1d1a4;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs geometry_msgs rosidl_default_runtime sensor_msgs shape_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Object_recognition_msgs contains the ROS message and the actionlib definition used in object_recognition_core";
  };
}
