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
        rev = "a0a5ef2b898e9d46d5e0f0a72e2e615ba4a4236a";
        hash = "sha256-+RjX6FziCw1Od7UtirSubgzS4A/zHmEjqGsHzyjvz+o=";
      };
    };
  });
  meta = {
    description = "Messages and services for the controller manager.";
  };
})
