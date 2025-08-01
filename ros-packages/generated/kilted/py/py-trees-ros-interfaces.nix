{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "py_trees_ros_interfaces";
  version = "2.1.1-2";
  src = finalAttrs.passthru.sources."py_trees_ros_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs diagnostic-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime unique-identifier-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs diagnostic-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime unique-identifier-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "py_trees_ros_interfaces" = substituteSource {
      src = fetchgit {
        name = "py_trees_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/py_trees_ros_interfaces-release.git";
        rev = "e7b6fb1722c48f8e384f1bd464e951f0f7349444";
        hash = "sha256-zAo2PFl8If37U7QigICSgeDB9DYHdmAupY8FvXBCVzM=";
      };
    };
  });
  meta = {
    description = "\n    Interfaces used by py_trees_ros and py_trees_ros_tutorials.\n  ";
  };
})
