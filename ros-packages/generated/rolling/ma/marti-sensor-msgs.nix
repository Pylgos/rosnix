{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_sensor_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_sensor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  passthru = {
    sources = mkSourceSet (sources: {
      "marti_sensor_msgs" = substituteSource {
        src = fetchgit {
          name = "marti_sensor_msgs-source";
          url = "https://github.com/ros2-gbp/marti_messages-release.git";
          rev = "f1ef8219a28db83f909557e0db9cebf3e996a93f";
          hash = "sha256-waPgK4Yx5LSjfVSvjvq9aI0o3wfx0K+KxSkCs103PhM=";
        };
      };
    });
  };
  meta = {
    description = "marti_sensor_msgs";
  };
})
