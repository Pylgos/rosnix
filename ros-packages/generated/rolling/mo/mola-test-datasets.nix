{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
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
  version = "0.4.2-1";
  src = finalAttrs.passthru.sources."mola_test_datasets";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ros-environment ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "mola_test_datasets" = substituteSource {
      src = fetchgit {
        name = "mola_test_datasets-source";
        url = "https://github.com/ros2-gbp/mola_test_datasets-release.git";
        rev = "9b9e8ac1b4147da0e8cb415d6faed31a49b61ba0";
        hash = "sha256-Hoq4/CRTRBbNH97jdPG1ais54BJwkHykwnB/PFEs8FE=";
      };
    };
  });
  meta = {
    description = "Small SLAM dataset extracts used for demos or unit tests in the rest of MOLA packages";
  };
})
