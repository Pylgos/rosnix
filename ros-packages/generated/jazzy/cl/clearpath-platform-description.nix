{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_platform_description";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."clearpath_platform_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "07668024da8fa2318b1babc289660f1bdf2c1713";
        hash = "sha256-HLBO0gc0IkLmExKVNqhSys9OvxxC9bFmMr6JX+xKMqw=";
      };
    };
  });
  meta = {
    description = "Clearpath Platform URDF descriptions";
  };
})
