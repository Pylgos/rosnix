{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "four_wheel_steering_msgs";
  version = "2.0.1-6";
  src = finalAttrs.passthru.sources."four_wheel_steering_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "four_wheel_steering_msgs" = substituteSource {
      src = fetchgit {
        name = "four_wheel_steering_msgs-source";
        url = "https://github.com/ros2-gbp/four_wheel_steering_msgs-release.git";
        rev = "8383f09339c68b443be5089a024d902a18428553";
        hash = "sha256-lESkZ6d2jUSfCCCB5KsV8gJwBTO0EG7O4/LInYggSzc=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages for robots using FourWheelSteering.\n  ";
  };
})
