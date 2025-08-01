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
  pname = "urg_c";
  version = "1.0.4001-6";
  src = finalAttrs.passthru.sources."urg_c";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "urg_c" = substituteSource {
      src = fetchgit {
        name = "urg_c-source";
        url = "https://github.com/ros2-gbp/urg_c-release.git";
        rev = "bab130904ee9a7877f878431c4946affbc92a108";
        hash = "sha256-d1sMppxyaGt43L2i5Eplkfen4tHz1t6hkC42mCbg0EM=";
      };
    };
  });
  meta = {
    description = "The urg_c package";
  };
})
