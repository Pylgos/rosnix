{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "micro_ros_diagnostic_msgs";
  version = "0.3.0-5";
  src = finalAttrs.passthru.sources."micro_ros_diagnostic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "micro_ros_diagnostic_msgs" = substituteSource {
      src = fetchgit {
        name = "micro_ros_diagnostic_msgs-source";
        url = "https://github.com/ros2-gbp/micro_ros_diagnostics-release.git";
        rev = "7b74b4eefec50ab6a568e17ca73958d28c74ec97";
        hash = "sha256-SzsjLMKb42ISN6YTe6pUsmSDS9aBoczr3ayWBkrJAgU=";
      };
    };
  });
  meta = {
    description = "Ccontains messages and service definitions for micro-ROS diagnostics.";
  };
})
