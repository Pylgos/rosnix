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
  pname = "turtlesim_msgs";
  version = "1.9.2-1";
  src = finalAttrs.passthru.sources."turtlesim_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlesim_msgs" = substituteSource {
        src = fetchgit {
          name = "turtlesim_msgs-source";
          url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
          rev = "32803185ffaa1712359144f154fa283c7ee22ee9";
          hash = "sha256-9dFwJZsBR6QXBfY2HhiX0w5K8eOkSgPLyZpmykHcDe0=";
        };
      };
    });
  };
  meta = {
    description = "turtlesim messages.";
  };
})
