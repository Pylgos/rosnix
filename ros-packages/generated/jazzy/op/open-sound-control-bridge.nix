{
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  open-sound-control-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "open_sound_control_bridge";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."open_sound_control_bridge";
  propagatedBuildInputs = [ open-sound-control-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "open_sound_control_bridge" = substituteSource {
      src = fetchgit {
        name = "open_sound_control_bridge-source";
        url = "https://github.com/ros2-gbp/open_sound_control-release.git";
        rev = "efc1ab2726c0b114f3d39143a913b0746071f573";
        hash = "sha256-ibclZIgyWFw3kTTf9XCVBgh7DuD+/DPlhEQ7TrtmV0o=";
      };
    };
  });
  meta = {
    description = "Bridge node for converting between OSC and ROS messages";
  };
})
