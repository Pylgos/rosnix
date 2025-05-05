{
  ament-cmake,
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
  pname = "open_sound_control_msgs";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."open_sound_control_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "open_sound_control_msgs" = substituteSource {
      src = fetchgit {
        name = "open_sound_control_msgs-source";
        url = "https://github.com/ros2-gbp/open_sound_control-release.git";
        rev = "c6cdc8f1fc1aabd4d78179a888bbd47ebeed397a";
        hash = "sha256-bLFf1zIMrzWizT39agrq+cbgBV3fbMqNNATS3WfAnqQ=";
      };
    };
  });
  meta = {
    description = "Open Sound Control messages for ROS 2";
  };
})
