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
  version = "2.1.1-1";
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
        rev = "c8c0070db4a2d964300d463c06066c9d4c721bbd";
        hash = "sha256-pBGiZklzPQ1pt6yXUAGV0MxOeEcIGkc32VA+cyXvqyU=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Messages";
  };
})
