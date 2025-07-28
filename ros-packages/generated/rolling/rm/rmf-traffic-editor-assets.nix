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
  version = "1.14.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "9c35b58b1ca487edbbabe5eff56aa2c17ffda8dc";
        hash = "sha256-J5+uxZ/WuNZi2xV6QP4WCaUaSVVfwWeJgX21aC8BudA=";
      };
    };
  });
  meta = {
    description = "Assets for use with traffic_editor.";
  };
})
