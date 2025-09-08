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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_manager_msgs";
  version = "5.6.0-1";
  src = finalAttrs.passthru.sources."controller_manager_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces lifecycle-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces lifecycle-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "controller_manager_msgs" = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "14e3eb7555a8d354855b2e274b5d1c27312e63e1";
        hash = "sha256-BTkLJYqF+1DzaYWBAHeUkGh8bHrt0dglD4mvtyNa8zc=";
      };
    };
  });
  meta = {
    description = "Messages and services for the controller manager.";
  };
})
