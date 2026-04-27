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
  version = "15.2.2-1";
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
        rev = "9cbfd7c18afd1b2973d4ff892067131cb59c3777";
        hash = "sha256-kq3867hPqedZ2djQ0ANlayRPuTbCv8fe5tJrM7XoK00=";
      };
    };
  });
  meta = {
    description = "\n    Library which provides the 3D rendering functionality in rviz.\n  ";
  };
})
