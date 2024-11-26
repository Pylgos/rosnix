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
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_assets";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "7db843be7c149dc679fb7f112d273a756ab76f07";
        hash = "sha256-hvm0OpnlRfng+KymFmP2C7+TLhgh/Tf2X7VmfiKfE6w=";
      };
    };
  });
  meta = {
    description = "Assets for use with traffic_editor.";
  };
})
