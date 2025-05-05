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
  version = "2.1.1-1";
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
        rev = "c7ccf77296f1f37510a9a965d893ec647aad85cf";
        hash = "sha256-zAo2PFl8If37U7QigICSgeDB9DYHdmAupY8FvXBCVzM=";
      };
    };
  });
  meta = {
    description = "\n    Interfaces used by py_trees_ros and py_trees_ros_tutorials.\n  ";
  };
})
