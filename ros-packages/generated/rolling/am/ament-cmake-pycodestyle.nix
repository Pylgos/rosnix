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
  version = "0.20.2-1";
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
        rev = "c68dc69baf4629c3d9a47a5c84fc751949dbec7c";
        hash = "sha256-Ib+ggu+J+fYZ87nuQZLKIW4gFgizX/JC6Ei9puClZWA=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pycodestyle to check code against the style conventions in\n    PEP 8.\n  ";
  };
})
