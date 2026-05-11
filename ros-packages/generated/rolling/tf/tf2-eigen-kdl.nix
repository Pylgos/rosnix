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
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_eigen_kdl";
  version = "0.46.0-1";
  src = finalAttrs.passthru.sources."tf2_eigen_kdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "liborocos-kdl" "liborocos-kdl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liborocos-kdl" "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_eigen_kdl" = substituteSource {
      src = fetchgit {
        name = "tf2_eigen_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "cfdaafcfb460a460af031c4d6e5df95baa992ba3";
        hash = "sha256-/O+LKKFw7Qqj47lmTo4kO8X++Vcd/FIq3os8o+vYy5I=";
      };
    };
  });
  meta = {
    description = "\n\n     Conversion functions between:\n      - Eigen and KDL\n\n  ";
  };
})
