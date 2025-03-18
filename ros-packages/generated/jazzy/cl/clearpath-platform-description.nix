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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_platform_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "7f85dee6b0ed58536769f1c134506ea9f48ffac4";
        hash = "sha256-WMjKzBPLG6KV3ligP7/WbIw29gQ9Vpw//IWgOWt+ZX4=";
      };
    };
  });
  meta = {
    description = "Clearpath Platform URDF descriptions";
  };
})
