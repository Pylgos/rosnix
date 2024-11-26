{
  action-msgs,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "teleop_tools_msgs";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."teleop_tools_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "teleop_tools_msgs" = substituteSource {
        src = fetchgit {
          name = "teleop_tools_msgs-source";
          url = "https://github.com/ros2-gbp/teleop_tools-release.git";
          rev = "1a0d1628627c38a3e9dc423a860efd5b78800acc";
          hash = "sha256-ew4H/L8sAVoI216eyavu6PeHyoJ9FUYvEUKi8xEaVr0=";
        };
      };
    });
  };
  meta = {
    description = "The teleop_tools_msgs package";
  };
})
