{
  ament-cmake,
  ament-cmake-gen-version-h,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_index_cpp";
  version = "1.14.0-1";
  src = finalAttrs.passthru.sources."ament_index_cpp";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_index_cpp" = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "db105e4e6a5d515fc01f955e02949e9ee6137074";
        hash = "sha256-h7sc29Wz1NNSCnF1+egSZoOrmOpMvS79HTqzfEnLl/Q=";
      };
    };
  });
  meta = {
    description = "\n    C++ API to access the ament resource index.\n  ";
  };
})
