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
  version = "2.8.4-1";
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
        rev = "d966361ded388802248a6a8034738adeb11c0952";
        hash = "sha256-AlNwvZVGNUkHc6A1wypTmRBqLJc5l3g3sKtj2XOq59U=";
      };
    };
  });
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
})
