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
  pname = "ecl_license";
  version = "1.0.3-5";
  src = finalAttrs.passthru.sources."ecl_license";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_license" = substituteSource {
      src = fetchgit {
        name = "ecl_license-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "82be18cfb0314aa509f14ebdf0f62747cf06477f";
        hash = "sha256-7IkZyQJw9go1s2je+YLPGemSTMtC8PNA66qCC6akU6w=";
      };
    };
  });
  meta = {
    description = "\n     Maintains the ecl licenses and also provides an install\n     target for deploying licenses with the ecl libraries.\n  ";
  };
})
