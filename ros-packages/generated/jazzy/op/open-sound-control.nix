{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  open-sound-control-bridge,
  open-sound-control-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_sound_control";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."open_sound_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ open-sound-control-bridge open-sound-control-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_sound_control" = substituteSource {
      src = fetchgit {
        name = "open_sound_control-source";
        url = "https://github.com/ros2-gbp/open_sound_control-release.git";
        rev = "5f94cdcf7df48f8835f0633388cf648b9ad32b84";
        hash = "sha256-1RGY+hUM9xEAjTmHuUxxZ1k2WpxKoE/Gdjs7PVeCBlk=";
      };
    };
  });
  meta = {
    description = "Metapackage for ROS/Open Sound Control bridge";
  };
})
