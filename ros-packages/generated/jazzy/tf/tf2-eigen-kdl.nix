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
  version = "0.36.5-1";
  src = finalAttrs.passthru.sources."tf2_eigen_kdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ orocos-kdl-vendor tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_eigen_kdl" = substituteSource {
        src = fetchgit {
          name = "tf2_eigen_kdl-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "2dc022f18694f5b9be2d7bec20d9b270051ea790";
          hash = "sha256-20rYDk7y50k9hqVr1z4tbB21MQ7eQxH+3WZ9EOlrdLs=";
        };
      };
    });
  };
  meta = {
    description = "Conversion functions between: - Eigen and KDL";
  };
})
