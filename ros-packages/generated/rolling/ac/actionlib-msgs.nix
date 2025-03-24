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
  pname = "actionlib_msgs";
  version = "5.5.0-1";
  src = finalAttrs.passthru.sources."actionlib_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "actionlib_msgs" = substituteSource {
      src = fetchgit {
        name = "actionlib_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "535647d354f1294e98c687170ce7aae82b853902";
        hash = "sha256-vWNdRsL17dCmxfhYiHCwFo3qNmLnBrNel8abaB8elUA=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions used in the implementation of ROS 1 actions.";
  };
})
