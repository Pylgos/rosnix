{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "actuator_msgs";
  version = "0.0.1-4";
  src = finalAttrs.passthru.sources."actuator_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "actuator_msgs" = substituteSource {
        src = fetchgit {
          name = "actuator_msgs-source";
          url = "https://github.com/ros2-gbp/actuator_msgs-release.git";
          rev = "5b3260652e5c325a328b021361985c4ef8b508f8";
          hash = "sha256-euXTvPVaV7xPFXP/lH9jg2S87V9DyFmp1EwJVlF7AVs=";
        };
      };
    });
  };
  meta = {
    description = "ROS 2 message interface for Actuators.";
  };
})
