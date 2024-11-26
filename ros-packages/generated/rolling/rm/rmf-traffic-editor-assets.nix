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
  version = "1.10.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_assets";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "f0ef7bdc973db38c071f7e3a43b72b862cd8799e";
        hash = "sha256-TrvjKiT+/oazcf8NPW7nprqf5nlc/ue8dQWyOgwNciQ=";
      };
    };
  });
  meta = {
    description = "Assets for use with traffic_editor.";
  };
})
