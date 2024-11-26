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
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."actionlib_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "actionlib_msgs" = substituteSource {
      src = fetchgit {
        name = "actionlib_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "786522906847491da603dd66c5b1d37bd488fea4";
        hash = "sha256-LtWxbdvwdhlOkvoPxjgQTcUVn3ZOCpo6hJOPsn9yJBI=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions used in the implementation of ROS 1 actions.";
  };
})
