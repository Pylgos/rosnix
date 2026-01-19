{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "event_camera_msgs";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."event_camera_msgs";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "event_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "event_camera_msgs-source";
        url = "https://github.com/ros2-gbp/event_camera_msgs-release.git";
        rev = "ea94b9fcc4dc4c2274782cd7a358a08a1832297f";
        hash = "sha256-V98VRun8M84tgWr/hLxzhDexfraT3whEcWvNgH33P/8=";
      };
    };
  });
  meta = {
    description = "messages for event based cameras";
  };
})
