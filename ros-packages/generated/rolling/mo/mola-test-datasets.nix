{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_test_datasets";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."mola_test_datasets";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_test_datasets" = substituteSource {
      src = fetchgit {
        name = "mola_test_datasets-source";
        url = "https://github.com/ros2-gbp/mola_test_datasets-release.git";
        rev = "392c24f1c4220d93ddc2dcf30744dcf30972f2b4";
        hash = "sha256-1n0ByrTtI44KL2C1Y+Ym/s1EWGV5lFFjuuXclW2YS/E=";
      };
    };
  });
  meta = {
    description = "Small SLAM dataset extracts used for demos or unit tests in the rest of MOLA packages";
  };
})
