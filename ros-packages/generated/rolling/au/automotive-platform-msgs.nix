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
  version = "3.0.4-5";
  src = finalAttrs.passthru.sources."automotive_platform_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "automotive_platform_msgs" = substituteSource {
      src = fetchgit {
        name = "automotive_platform_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "4e9bb5fba5ecceab04c7735889f0c0bf9c6cc2b1";
        hash = "sha256-HMhXhLS41h9P1STIbuEdhOgxNORj/YJrfDldGKeMKfA=";
      };
    };
  });
  meta = {
    description = "Generic Messages for Communication with an Automotive Autonomous Platform";
  };
})
