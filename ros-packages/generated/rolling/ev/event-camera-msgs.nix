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
  version = "2.0.0-1";
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
        rev = "a40389a6de59f44c6129475dc80811d94cf44e76";
        hash = "sha256-0pY3R7oCla7OUPQSD3KXGzZaicYu5kw2wHGYKgFQcz4=";
      };
    };
  });
  meta = {
    description = "messages for event based cameras";
  };
})
