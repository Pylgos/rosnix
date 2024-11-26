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
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."tf2_eigen_kdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ orocos-kdl-vendor tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_eigen_kdl" = substituteSource {
      src = fetchgit {
        name = "tf2_eigen_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "47b060dd5b7a368259565308fb18e00762b796e1";
        hash = "sha256-mSazi/AuXqxpjg3y/SpbRg7kyNMXmwau+KvGoKcyE6k=";
      };
    };
  });
  meta = {
    description = "Conversion functions between: - Eigen and KDL";
  };
})
