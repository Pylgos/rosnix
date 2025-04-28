{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gen_version_h";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_gen_version_h";
  nativeBuildInputs = [ ament-package ];
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-package ];
  propagatedBuildInputs = [ ament-cmake-core ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gen_version_h" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gen_version_h-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "d949abc240d8b862cbe9a23fd45b87dc63048a2c";
        hash = "sha256-hD2xQqj7qVu9veXdviB1oT7vUl+NxnmIxA7LU4OO67Q=";
      };
    };
  });
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
})
