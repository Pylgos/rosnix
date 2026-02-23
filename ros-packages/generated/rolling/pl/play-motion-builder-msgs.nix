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
  pname = "play_motion_builder_msgs";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."play_motion_builder_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "play_motion_builder_msgs" = substituteSource {
      src = fetchgit {
        name = "play_motion_builder_msgs-source";
        url = "https://github.com/ros2-gbp/play_motion_builder-release.git";
        rev = "f49d0660aa0519b438b119db97509d76e36783a9";
        hash = "sha256-tDhjcxqNqmFbiqUuXKjZ5x+fylTxtBmv0EE55gupyAc=";
      };
    };
  });
  meta = {
    description = "The play_motion_builder_msgs package";
  };
})
