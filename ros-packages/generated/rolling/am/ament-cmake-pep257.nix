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
  version = "0.19.2-1";
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
        rev = "3306ac4bc2d7e47a6f73b958d80259a70fe1dab0";
        hash = "sha256-EmR6L1qQVjy9VAbBS2DzQbFpPdtcdHrx/8xZOYj5U7s=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_pep257 to check code against the docstring style conventions in PEP 257.";
  };
})
