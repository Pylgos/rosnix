{
  ament-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_clang_tidy";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_tidy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "562390b923d85145a6adf9531e3a9f3a9e2422a4";
        hash = "sha256-4ZgjaZqJQsEHsalfHbssmhm/5Hx+sM1L+BWEMkKOds4=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.";
  };
})
