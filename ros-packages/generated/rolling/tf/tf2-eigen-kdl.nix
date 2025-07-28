{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  orocos-kdl-vendor,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_eigen_kdl";
  version = "0.43.1-1";
  src = finalAttrs.passthru.sources."tf2_eigen_kdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ orocos-kdl-vendor tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ orocos-kdl-vendor tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_eigen_kdl" = substituteSource {
      src = fetchgit {
        name = "tf2_eigen_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "88194b6c71e9da0926712ecb9ef28c6a7e913406";
        hash = "sha256-OjNqrSqYxmHjJq4QJDhAliU8P+NrgNiFnzHE023DtBk=";
      };
    };
  });
  meta = {
    description = "\n\n     Conversion functions between:\n      - Eigen and KDL\n\n  ";
  };
})
