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
  version = "2.1.0-4";
  src = finalAttrs.passthru.sources."py_trees_ros_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs diagnostic-msgs geometry-msgs rosidl-default-runtime unique-identifier-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "py_trees_ros_interfaces" = substituteSource {
        src = fetchgit {
          name = "py_trees_ros_interfaces-source";
          url = "https://github.com/ros2-gbp/py_trees_ros_interfaces-release.git";
          rev = "461e14c922c6c5c08dac7346b43608f832d30045";
          hash = "sha256-QrixpzDzAj86KcSWBgYVI0CjrjuAtdFy7bMlEJgweaw=";
        };
      };
    });
  };
  meta = {
    description = "Interfaces used by py_trees_ros and py_trees_ros_tutorials.";
  };
})
