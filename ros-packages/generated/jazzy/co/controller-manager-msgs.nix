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
  version = "4.25.0-1";
  src = finalAttrs.passthru.sources."controller_manager_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces lifecycle-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "controller_manager_msgs" = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "7aff7221c8278db104ed796fadf5372b61212600";
        hash = "sha256-FkqcK+5HnzqvfmNolpT0uHCxwx/mS5+3bH9kLq4TS54=";
      };
    };
  });
  meta = {
    description = "Messages and services for the controller manager.";
  };
})
