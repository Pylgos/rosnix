{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pclint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pclint";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_pclint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pclint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_pclint" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_pclint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "4598f7358b2566f461b4efa944ecdfb9c7c2c050";
          hash = "sha256-+z9pHdy7Qbg/M9gZwkH5b3ZxkoTFPhe10AO3sfjvn1I=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_pclint to perform static code analysis on C/C++ code using PC-lint.";
  };
})
