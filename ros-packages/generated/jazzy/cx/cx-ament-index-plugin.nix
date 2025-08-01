{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  clips-vendor,
  cx-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_ament_index_plugin";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."cx_ament_index_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp clips-vendor cx-plugin cx-utils pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp clips-vendor cx-plugin cx-utils pluginlib ];
  passthru.sources = mkSourceSet (sources: {
    "cx_ament_index_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_ament_index_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "516d0548ba4934a402269026995561f8601e6b61";
        hash = "sha256-3+qMYlMwdKRVw/IWhOf68v7Kkvy6YvLFFdke38xPO+E=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin for accessing ament_index via ament_index_cpp";
  };
})
