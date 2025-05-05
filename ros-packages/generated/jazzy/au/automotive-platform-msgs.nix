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
  pname = "automotive_platform_msgs";
  version = "3.0.4-6";
  src = finalAttrs.passthru.sources."automotive_platform_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "automotive_platform_msgs" = substituteSource {
      src = fetchgit {
        name = "automotive_platform_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "52a0f24bbcbe3b2a5f503ada8e224014cab98b6c";
        hash = "sha256-HMhXhLS41h9P1STIbuEdhOgxNORj/YJrfDldGKeMKfA=";
      };
    };
  });
  meta = {
    description = "Generic Messages for Communication with an Automotive Autonomous Platform";
  };
})
