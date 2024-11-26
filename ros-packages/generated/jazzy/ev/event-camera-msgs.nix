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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."event_camera_msgs";
  nativeBuildInputs = [ ament-cmake ros-environment ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "event_camera_msgs" = substituteSource {
        src = fetchgit {
          name = "event_camera_msgs-source";
          url = "https://github.com/ros2-gbp/event_camera_msgs-release.git";
          rev = "91ad63afda709d4e566d992476ed002309af2f20";
          hash = "sha256-1ZtF5SndbEknqRZ9evnMI25GzONA2ezHKphMlwhsk0g=";
        };
      };
    });
  };
  meta = {
    description = "messages for event based cameras";
  };
})
