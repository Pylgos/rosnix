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
  version = "4.28.0-1";
  src = finalAttrs.passthru.sources."controller_manager_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces lifecycle-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "controller_manager_msgs" = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "3fceb6581ba3f236a1632791508bc0b466585f21";
        hash = "sha256-y4ePs9hBKvdj0FrgOpIPafXNO419gdSaEJIR2htzUEs=";
      };
    };
  });
  meta = {
    description = "Messages and services for the controller manager.";
  };
})
