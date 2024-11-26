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
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "neobotix_usboard_msgs";
  version = "4.0.0-4";
  src = finalAttrs.passthru.sources."neobotix_usboard_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "neobotix_usboard_msgs" = substituteSource {
      src = fetchgit {
        name = "neobotix_usboard_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "4d80630c58872af31fe2bc99eedddb30fe53971b";
        hash = "sha256-dKwQGX4Fl0MagRbLNTnXobUGLXFfems8P6ArP7uljjs=";
      };
    };
  });
  meta = {
    description = "neobotix_usboard package";
  };
})
