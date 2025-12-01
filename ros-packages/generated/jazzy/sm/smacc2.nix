{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  smacc2-msgs,
  substituteSource,
  tracetools,
  tracetools-launch,
  tracetools-trace,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "smacc2";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."smacc2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcl rclcpp rclcpp-action smacc2-msgs tracetools tracetools-launch tracetools-trace ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-thread" "libboost-thread-dev" "liblttng-ust-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcl rclcpp rclcpp-action smacc2-msgs tracetools tracetools-launch tracetools-trace ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-thread" "libboost-thread-dev" "liblttng-ust-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "smacc2" = substituteSource {
      src = fetchgit {
        name = "smacc2-source";
        url = "https://github.com/robosoft-ai/SMACC2-release.git";
        rev = "9186c963b725f77e1969d02b45559527a9ff39be";
        hash = "sha256-yXI7rD87VVBGxlt4LJei2YGV5tCAc1SAxX9jae/U/b4=";
      };
    };
  });
  meta = {
    description = "An Event-Driven, Asynchronous, Behavioral State Machine Library for ROS2 (Robotic Operating System) applications written in C++.";
  };
})
