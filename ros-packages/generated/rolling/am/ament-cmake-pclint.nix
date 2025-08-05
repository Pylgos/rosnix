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
  version = "0.20.2-1";
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
        rev = "f139a798e54a1ed6e5a4bc167ab0387080468ff9";
        hash = "sha256-ZGtEACzLKBvlDhZ0mWz8PLMOmUl5NWzUP7jeg58vh4c=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pclint to perform static code analysis on C/C++\n    code using PC-lint.\n  ";
  };
})
