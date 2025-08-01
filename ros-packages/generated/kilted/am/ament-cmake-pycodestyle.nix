{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pycodestyle,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pycodestyle";
  version = "0.19.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_pycodestyle";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pycodestyle ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-pycodestyle ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pycodestyle" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "863fb7ddf081b8b001d2ff1af4fc8e02d303a3b6";
        hash = "sha256-pfp2cga4MLVXk91UHx0lzqGOnqRsEuCivmw8H0FSKAY=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pycodestyle to check code against the style conventions in\n    PEP 8.\n  ";
  };
})
