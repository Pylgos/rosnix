{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  resource-retriever,
  rosSystemPackages,
  rviz-ogre-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_rendering";
  version = "16.0.0-1";
  src = finalAttrs.passthru.sources."rviz_rendering";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" "assimp-dev" "eigen" "libqtcore" "libqtgui" "libqtopengl" "libqtsvg" "qt-base-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "assimp-dev" "eigen" "libqtcore" "libqtgui" "libqtopengl" "libqtsvg" "qt-base-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_rendering" = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "e9ba7a52f8d6d65d1823729c45514e3b4d05d746";
        hash = "sha256-PemNyn93fMba0cNQcs9voPiEkztkvVcgW5Z3vWkh83Q=";
      };
    };
  });
  meta = {
    description = "\n    Library which provides the 3D rendering functionality in rviz.\n  ";
  };
})
