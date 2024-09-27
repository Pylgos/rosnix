{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    four_wheel_steering_msgs-cf71cef5c668cd51e53724dc48c8d7201221e3de = substituteSource {
      src = fetchgit {
        name = "four_wheel_steering_msgs-cf71cef5c668cd51e53724dc48c8d7201221e3de-source";
        url = "https://github.com/ros2-gbp/four_wheel_steering_msgs-release.git";
        rev = "cf71cef5c668cd51e53724dc48c8d7201221e3de";
        hash = "sha256-lESkZ6d2jUSfCCCB5KsV8gJwBTO0EG7O4/LInYggSzc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "four_wheel_steering_msgs";
  version = "2.0.1-6";
  src = sources.four_wheel_steering_msgs-cf71cef5c668cd51e53724dc48c8d7201221e3de;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for robots using FourWheelSteering.";
  };
}
