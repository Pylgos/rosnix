{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "robot_calibration_msgs";
  version = "0.9.3-1";
  src = finalAttrs.passthru.sources."robot_calibration_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "robot_calibration_msgs" = substituteSource {
      src = fetchgit {
        name = "robot_calibration_msgs-source";
        url = "https://github.com/ros2-gbp/robot_calibration-release.git";
        rev = "95d3014e3449517a22edb2fd29f6e8fc562bb440";
        hash = "sha256-K6kjfJsh/KFslHdWD2rlyQBJDVUBEb2f0nJoHck+pcU=";
      };
    };
  });
  meta = {
    description = "Messages for calibrating a robot";
  };
})
