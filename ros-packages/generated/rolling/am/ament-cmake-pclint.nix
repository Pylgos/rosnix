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
  version = "0.20.3-1";
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
        rev = "24e2bfaed52b9ed3fe49755404244c4903f405a7";
        hash = "sha256-YxqAlVaHH56yKUSvwNCdkr5Q5MiR/cvQIP0WJgtU/kk=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pclint to perform static code analysis on C/C++\n    code using PC-lint.\n  ";
  };
})
