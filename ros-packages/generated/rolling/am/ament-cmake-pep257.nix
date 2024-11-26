{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pep257";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_pep257";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pep257 ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-pep257 ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4e3e4a16e6327e9df7b96913b568483bcc6ce825";
        hash = "sha256-tfB+OyWod49pejjDDAYdShld9E8snrU6ityY882pyoI=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_pep257 to check code against the docstring style conventions in PEP 257.";
  };
})
