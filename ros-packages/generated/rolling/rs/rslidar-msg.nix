{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rslidar_msg";
  version = "0.0.0-2";
  src = finalAttrs.passthru.sources."rslidar_msg";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rclcpp rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rslidar_msg" = substituteSource {
      src = fetchgit {
        name = "rslidar_msg-source";
        url = "https://github.com/ros2-gbp/rslidar_msg-release.git";
        rev = "4c16081239e39d7ba24aca432b016380dbf877ae";
        hash = "sha256-hoIl9SGx6AoaPdOqKDzxdwuXznCZhGG3cNJvuGb9OPg=";
      };
    };
  });
  meta = {
    description = "ros msgs for the rslidar_sdk project";
  };
})
