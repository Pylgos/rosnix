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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosgraph_msgs";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."rosgraph_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_msgs" = substituteSource {
      src = fetchgit {
        name = "rosgraph_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "73971e3c277f8779f921b6b6895493ae62a7fe93";
        hash = "sha256-eHxwSZ0HenIq7ks/tP4EqiIEqM0+gNmLsc1DkHP3bLA=";
      };
    };
  });
  meta = {
    description = "Messages relating to the ROS Computation Graph. These are generally considered to be low-level messages that end users do not interact with.";
  };
})
