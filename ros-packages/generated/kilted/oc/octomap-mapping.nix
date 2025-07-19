{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap-server,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_mapping";
  version = "2.3.0-2";
  src = finalAttrs.passthru.sources."octomap_mapping";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ octomap-server ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ octomap-server ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_mapping" = substituteSource {
      src = fetchgit {
        name = "octomap_mapping-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "187c99cda9715d1f50795d600ee792ec3c5f8300";
        hash = "sha256-b/eXXTaTKgI3DlT33nue0Yz0x52yTantz+VlRbfMyzI=";
      };
    };
  });
  meta = {
    description = "\n    Mapping tools to be used with the ";
  };
})
