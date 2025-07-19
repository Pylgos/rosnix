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
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_config_plugin";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."cx_config_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp clips-vendor cx-plugin cx-utils pluginlib yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp clips-vendor cx-plugin cx-utils pluginlib yaml-cpp-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "cx_config_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_config_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "814a02c3faf83701c471443254d63834a6577765";
        hash = "sha256-6NdHNs/dViky5DKP3iPciGoFC5rsN5UaBVy8H+uiE5o=";
      };
    };
  });
  meta = {
    description = "CX plugin to parse yaml files and provide the values to CLIPS";
  };
})
