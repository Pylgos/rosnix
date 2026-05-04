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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_applications_msgs";
  version = "1.0.1-2";
  src = finalAttrs.passthru.sources."turtlebot3_applications_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_applications_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_applications_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications_msgs-release.git";
        rev = "80320ecbc81af6d912faa95edd259fba8590c8c6";
        hash = "sha256-M0v5HgZUtxxTYm3uNyeF4Lgl0kMe9Ni0omiGqkWCyTQ=";
      };
    };
  });
  meta = {
    description = "\n    Message and service types: custom messages and services for TurtleBot3 Applications packages\n  ";
  };
})
