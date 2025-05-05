{
  action-msgs,
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
  sensor-msgs,
  shape-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "object_recognition_msgs";
  version = "2.0.0-4";
  src = finalAttrs.passthru.sources."object_recognition_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "object_recognition_msgs" = substituteSource {
      src = fetchgit {
        name = "object_recognition_msgs-source";
        url = "https://github.com/ros2-gbp/object_recognition_msgs-release.git";
        rev = "7485fba77d1b2a6cf783f0a288eb029a64b1d1a4";
        hash = "sha256-51GLrMSSWkdlTz5SBW9ImQilU5Rojo8emRiwZZtZtS0=";
      };
    };
  });
  meta = {
    description = "Object_recognition_msgs contains the ROS message and the actionlib definition used in object_recognition_core";
  };
})
