{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cpplint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_cpplint";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_cpplint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-cpplint ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-cpplint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_cpplint" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_cpplint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "0692c451f263dc09367300949dbf28dc32c657c4";
          hash = "sha256-YUG+IzG8bzZdDuNFHNYJV5vTaqjDFh1PK7mPXbKeKYc=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_cpplint to lint C / C++ code using cpplint.";
  };
})
