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
  version = "0.20.1-1";
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
        rev = "4365b895f18932c558b69dee05b41ddd631733cc";
        hash = "sha256-1PDkpGpx4Pz6MXpKo/30jXz87Ljkr3IPeTgdZDVi40I=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_cpplint to lint C / C++ code using cpplint.\n  ";
  };
})
