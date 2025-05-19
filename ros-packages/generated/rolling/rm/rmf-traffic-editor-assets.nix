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
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "619c62624c75da1e2bb01c626bc21d39eb0c7e7c";
        hash = "sha256-0MhEU+/v8990xt6F9q4cfkDHp0C2Kmhkh9mKZXSIxuA=";
      };
    };
  });
  meta = {
    description = "Assets for use with traffic_editor.";
  };
})
