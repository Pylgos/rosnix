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
  version = "0.20.5-3";
  src = finalAttrs.passthru.sources."ament_cmake_pclint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pclint ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-pclint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9d71865e8b0ae4453c880a354a02db040fd611ca";
        hash = "sha256-mTUTfF2bDjGV8SKjWPwWZoX8/W97xrlWVzaDhQx3Hm8=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pclint to perform static code analysis on C/C++\n    code using PC-lint.\n  ";
  };
})
