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
  version = "0.36.13-1";
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
        rev = "d6fe275777d869c394dbc1fa56a0872d813aacdb";
        hash = "sha256-7BWmDPlcMy2ghG52ZqY3ItS/CU81gLJdHNczp0lwjCQ=";
      };
    };
  });
  meta = {
    description = "\n\n     Conversion functions between:\n      - Eigen and KDL\n\n  ";
  };
})
