{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_manager_msgs";
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."controller_manager_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces lifecycle-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "controller_manager_msgs" = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "9c0e0544bf286218c6901fa1975d5273c0568b80";
        hash = "sha256-+RjX6FziCw1Od7UtirSubgzS4A/zHmEjqGsHzyjvz+o=";
      };
    };
  });
  meta = {
    description = "Messages and services for the controller manager.";
  };
})
