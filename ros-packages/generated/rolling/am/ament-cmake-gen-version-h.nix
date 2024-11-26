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
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_gen_version_h";
  nativeBuildInputs = [ ament-package ];
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-package ];
  propagatedBuildInputs = [ ament-cmake-core ];
  checkInputs = [ ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_gen_version_h" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_gen_version_h-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "29420ecdfe79eae8e65d4aa6bf5930d1ae3c45a3";
          hash = "sha256-Su8YIxwdG0MazPOstlu5ngxkwtoDotGqn75CbijWmP4=";
        };
      };
    });
  };
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
})
