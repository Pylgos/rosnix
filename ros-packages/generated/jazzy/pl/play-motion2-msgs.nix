{
  action-msgs,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "play_motion2_msgs";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."play_motion2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "play_motion2_msgs" = substituteSource {
      src = fetchgit {
        name = "play_motion2_msgs-source";
        url = "https://github.com/ros2-gbp/play_motion2-release.git";
        rev = "fccc6267d81256bf1e0ca4ff99b75e0771837204";
        hash = "sha256-WDT84LXt5btq3RVmLP/1dB0udHg0pzB0t/A4bd727m4=";
      };
    };
  });
  meta = {
    description = "Play a pre-recorded motion on a robot";
  };
})
