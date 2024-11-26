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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."octomap_mapping";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ octomap-server ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "octomap_mapping" = substituteSource {
        src = fetchgit {
          name = "octomap_mapping-source";
          url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
          rev = "6cd31f823198e3f9f2d6170ee0daf5979eabccc2";
          hash = "sha256-b/eXXTaTKgI3DlT33nue0Yz0x52yTantz+VlRbfMyzI=";
        };
      };
    });
  };
  meta = {
    description = "Mapping tools to be used with the";
  };
})
