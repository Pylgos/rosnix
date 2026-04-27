{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libbase,
  mrpt-libtclap,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_launcher";
  version = "2.7.0-1";
  src = finalAttrs.passthru.sources."mola_launcher";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-kernel mrpt-libbase mrpt-libtclap ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libbase mrpt-libtclap ros-environment ];
  checkInputs = [ ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "mola_launcher" = substituteSource {
      src = fetchgit {
        name = "mola_launcher-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "43742e98f2be4b4516793b3518f2f52815c1cc48";
        hash = "sha256-6R1r/hFXy8R8RXYrHZWC+Xlvol/Qf3sj+T2M9drvzYY=";
      };
    };
  });
  meta = {
    description = "Launcher app for MOLA systems";
  };
})
