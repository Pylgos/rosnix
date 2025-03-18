{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_customization";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_customization";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_customization" = substituteSource {
      src = fetchgit {
        name = "clearpath_customization-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "4dc57e5405b03c4122b23b7d4bd7d61b5c389ed3";
        hash = "sha256-s6OzjVSukZE68bahmEVTuKf+LBr4zgM0J0Yb997Xzwo=";
      };
    };
  });
  meta = {
    description = "Clearpath customization packages.";
  };
})
