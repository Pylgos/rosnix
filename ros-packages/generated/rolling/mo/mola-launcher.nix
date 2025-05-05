{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
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
  version = "1.6.4-1";
  src = finalAttrs.passthru.sources."mola_launcher";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint mola-kernel mrpt-libbase mrpt-libtclap ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint mola-kernel mrpt-libbase mrpt-libtclap ros-environment ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_launcher" = substituteSource {
      src = fetchgit {
        name = "mola_launcher-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b059d819748ded3ad582b0c0b10c4f5513c3c029";
        hash = "sha256-AHooreT3n9JBYQZrts7wX7SMG5Hnzlykj7A3g+m8scw=";
      };
    };
  });
  meta = {
    description = "Launcher app for MOLA systems";
  };
})
