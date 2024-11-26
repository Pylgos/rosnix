{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-image-overlay-layer,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vision_msgs_layers";
  version = "0.2.0-4";
  src = finalAttrs.passthru.sources."vision_msgs_layers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rqt-image-overlay-layer vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vision_msgs_layers" = substituteSource {
      src = fetchgit {
        name = "vision_msgs_layers-source";
        url = "https://github.com/ros2-gbp/vision_msgs_layers-release.git";
        rev = "309c516bbf9f26bc20f61969a4962659f3b4ad3c";
        hash = "sha256-/AF+whPTfuXAf3vP/iP6XQf4SZFSuJjxb7oQ61JEiGs=";
      };
    };
  });
  meta = {
    description = "Collection of RQt Image Overlay Plugins for Vision Msgs";
  };
})
