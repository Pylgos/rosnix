{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_visualization_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_visualization_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_visualization_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "306f1d7c798f4bbb2d3c8bbdf5a2e9bce4d638a3";
        hash = "sha256-YNsCs5+k+7cvdOc35aJo5NeZfXvNOqSFDlyGbWKeW7o=";
      };
    };
  });
  meta = {
    description = "marti_visualization_msgs";
  };
})
