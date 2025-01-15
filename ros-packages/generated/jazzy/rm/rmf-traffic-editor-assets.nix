{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_editor_assets";
  version = "1.9.2-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_assets";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "91665fff001d19e75862cd228a19d5f518c45577";
        hash = "sha256-l1u4o2XPmwnbtQB+T3p2qwpxJZ3oCxjlDCoZMXkqjR8=";
      };
    };
  });
  meta = {
    description = "Assets for use with traffic_editor.";
  };
})
