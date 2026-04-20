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
  version = "0.19.3-2";
  src = finalAttrs.passthru.sources."ament_cmake_cpplint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-cpplint ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-cpplint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_cpplint" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "5bd152b7ae8d78e6a07705f39e946c0764381b5c";
        hash = "sha256-zKLKT7g4XuWpbW64jqCLqxR9BARQk/OJg/EySxzCIT0=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_cpplint to lint C / C++ code using cpplint.\n  ";
  };
})
