{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raph-description,
  raph-interfaces,
  raph-teleop,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."raph";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ raph-description raph-interfaces raph-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raph-description raph-interfaces raph-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "raph" = substituteSource {
      src = fetchgit {
        name = "raph-source";
        url = "https://github.com/ros2-gbp/raph_common-release.git";
        rev = "d3f071b73a78bd678c7459053ec357b5ec71f68b";
        hash = "sha256-0Wkak3ODlsnFG/e+BCDcfF1CD22SsattvWbBWCcq3HA=";
      };
    };
  });
  meta = {
    description = "\n    Packages for Raph Rover common to the robot and desktop\n  ";
  };
})
