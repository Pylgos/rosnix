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
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."mola_launcher";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  propagatedBuildInputs = [ mola-kernel mrpt-libbase mrpt-libtclap ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_launcher" = substituteSource {
      src = fetchgit {
        name = "mola_launcher-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "ddf2dbc6e94c2dc51aba7e3462e7f864c31c9044";
        hash = "sha256-S8oBftv9LhVeIEM3sGdwHzYXHeDsC+eho/Z773mIQMk=";
      };
    };
  });
  meta = {
    description = "Launcher app for MOLA systems";
  };
})
