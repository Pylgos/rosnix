{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "turtlebot4_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."turtlebot4_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "a59af7362105b8502e921de753e8e9d93554bf41";
        hash = "sha256-ye3i4piqeRzz7nSgBTKdoJqwMDHBc/BqpPm4tpB+kyY=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Messages";
  };
})
