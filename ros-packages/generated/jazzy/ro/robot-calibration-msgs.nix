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
  version = "0.9.2-1";
  src = finalAttrs.passthru.sources."robot_calibration_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "robot_calibration_msgs" = substituteSource {
        src = fetchgit {
          name = "robot_calibration_msgs-source";
          url = "https://github.com/ros2-gbp/robot_calibration-release.git";
          rev = "9731a4d50b7bb9ef9d65c3ecbbee2cc0825199a9";
          hash = "sha256-ZclWYf7T+n5+C1V8bptBIe00qXGhhkjruRIBb4TCJKQ=";
        };
      };
    });
  };
  meta = {
    description = "Messages for calibrating a robot";
  };
})
