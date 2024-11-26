{
  action-msgs,
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
  pname = "turtlebot3_msgs";
  version = "2.2.1-4";
  src = finalAttrs.passthru.sources."turtlebot3_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlebot3_msgs" = substituteSource {
        src = fetchgit {
          name = "turtlebot3_msgs-source";
          url = "https://github.com/ros2-gbp/turtlebot3_msgs-release.git";
          rev = "b8b5a3842c7e91d15970bcfeb1879deb395a62ee";
          hash = "sha256-AfTC3VY2EzfPdav7DvNaPrB+NM5laHjJRrpSaWfb2Cw=";
        };
      };
    });
  };
  meta = {
    description = "Message and service types: custom messages and services for TurtleBot3 packages for ROS2";
  };
})
