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
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."mola_test_datasets";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint ros-environment ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_test_datasets" = substituteSource {
      src = fetchgit {
        name = "mola_test_datasets-source";
        url = "https://github.com/ros2-gbp/mola_test_datasets-release.git";
        rev = "2abe67bafdb0f6bb31aa0e85dc6f53e195288477";
        hash = "sha256-Tdgi7DyexzXFB0ZSXFh+vexv9Swh4tg0dYg8RLOdjYI=";
      };
    };
  });
  meta = {
    description = "Small SLAM dataset extracts used for demos or unit tests in the rest of MOLA packages";
  };
})
