{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cppcheck,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_cppcheck";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_cppcheck";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_cppcheck" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_cppcheck-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "d180989000970b2979d9d6d84f76c6171ee9ab20";
          hash = "sha256-LQPg2oJF0/bIp0FvFMLWVNZfmW0Bka5DQlsufV23qJk=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_cppcheck to perform static code analysis on C/C++ code using Cppcheck.";
  };
})
