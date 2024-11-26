{
  ament-cmake,
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
  pname = "ackermann_msgs";
  version = "2.0.2-6";
  src = finalAttrs.passthru.sources."ackermann_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ackermann_msgs" = substituteSource {
        src = fetchgit {
          name = "ackermann_msgs-source";
          url = "https://github.com/ros2-gbp/ackermann_msgs-release.git";
          rev = "c36723cfed1874827a122ca18bb40401753b0512";
          hash = "sha256-zn0jbHQ6PrAlpzAwpr3Tu01dOE8TVcs0XYlTXL0x8wg=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 messages for robots using Ackermann steering.";
  };
})
