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
  version = "2.0.1-1";
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
        rev = "d53a30fea3fa9c342a581bb448835bb0e8cf88ff";
        hash = "sha256-q6jLBF2qmGN/UxXkIx4vOHvwWNI4h11tP7kHX8owi7U=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Messages";
  };
})
