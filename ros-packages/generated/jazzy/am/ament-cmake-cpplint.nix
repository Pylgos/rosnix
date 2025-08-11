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
  version = "0.17.3-1";
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
        rev = "db8cd9d4d272b296b529154320f3f7d3a9f239a5";
        hash = "sha256-RDPaeVFdJiw/tzOa90o8+HwiTLtv4eMtXxUB4ONOMOM=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_cpplint to lint C / C++ code using cpplint.\n  ";
  };
})
