{
  ament-black,
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_black";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."ament_cmake_black";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-black ament-cmake-test ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-black ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_black" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_black-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "71b72e28a838b97a561bb0340e64508af62c910b";
        hash = "sha256-0MeW5VEeAx+5Xe3/7vfYkIJ5e5dOzQzYoTKGJKtk7dw=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_black to lint Python code using black.\n  ";
  };
})
