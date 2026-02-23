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
  version = "1.8.3-1";
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
        rev = "ca2f629a1be00060b3b6ab2469b88986534f07b4";
        hash = "sha256-fMx4ZMs/vThcLCYN+FzrUBV26BT6Pp9KiEBYeNncac8=";
      };
    };
  });
  meta = {
    description = "Play a pre-recorded motion on a robot";
  };
})
