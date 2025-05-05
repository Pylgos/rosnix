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
  version = "5.3.6-1";
  src = finalAttrs.passthru.sources."actionlib_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "actionlib_msgs" = substituteSource {
      src = fetchgit {
        name = "actionlib_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "8fa563b15937bb0fa75bf8559c5f7ecb6f74b6ff";
        hash = "sha256-U/N021pswTtuZAJROA4XF1y+6kEDmvC4Vwez78ue6T8=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions used in the implementation of ROS 1 actions.";
  };
})
