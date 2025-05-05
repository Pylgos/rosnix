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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rosgraph_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_msgs" = substituteSource {
      src = fetchgit {
        name = "rosgraph_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "0fbcf93df06a6464554bd23a97521c89955f14cf";
        hash = "sha256-SbK7a/38aT9uJ1KM6U33RSkWWT0zTAfPVCsPzJkGs3Y=";
      };
    };
  });
  meta = {
    description = "\n    Messages relating to the ROS Computation Graph.\n    These are generally considered to be low-level messages that end users do not interact with.\n  ";
  };
})
