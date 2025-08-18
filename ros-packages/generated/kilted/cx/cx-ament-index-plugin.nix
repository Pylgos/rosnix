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
  version = "0.1.3-1";
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
        rev = "d09421b6b5da2afcf734ae8a0da707ceb4426ebb";
        hash = "sha256-1DznebFr46Dr3LTAfKa4Cvk9pa+CUdMchTbdu9tXCEw=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin for accessing ament_index via ament_index_cpp";
  };
})
